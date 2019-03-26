library(pracma)


### Name: regexp
### Title: Match regular expression
### Aliases: regexp regexpi
### Keywords: string

### ** Examples

s <- "bat cat can car COAT court cut ct CAT-scan"
pat <-  'c[aeiou]+t'
regexp(s, pat)
regexpi(s, pat)



