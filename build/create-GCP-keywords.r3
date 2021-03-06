Rebol []

;keywords: load %keywords.r2
;append keywords load %keywords.r3
;keywords: unique keywords
;
; Just get rebol3 key(words)
keywords: load %keywords.r3

; remove 1 char function words (GCP KEYWORD doesn't like these)
; NB. GCP grammar as issue with 1 char keywords!
remove-each n keywords [1 = length? to-string n]

; if doesn't start with alpha then assume op and remove
alpha: charset [#"a" - #"z" #"A" - #"Z"]
remove-each n keywords [not parse to-string pick to-string n 1 [alpha]]  ;not parse n/1 alpha]

; remove words we don't want
; NB. remove COMMENT because we have a GCP rule for this
remove/part find keywords 'comment 1

; sort on longest (token) first
sort/compare keywords func [a b] [(length? to-string a) > (length? to-string b)]

; output (normally to save as GCP-keywords.r)
probe keywords
