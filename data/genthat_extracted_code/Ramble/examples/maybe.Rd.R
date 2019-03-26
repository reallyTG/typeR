library(Ramble)


### Name: maybe
### Title: 'maybe' matches 0 or 1 of pattern 'p'.  In EBNF notation, this
###   corresponds to a question mark ('?').
### Aliases: maybe

### ** Examples

maybe(Digit())("123abc")
maybe(Digit())("abc123")



