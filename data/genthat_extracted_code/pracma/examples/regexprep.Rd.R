library(pracma)


### Name: regexprep
### Title: Replace string using regular expression
### Aliases: regexprep
### Keywords: string

### ** Examples

s <- "bat cat can car COAT court cut ct CAT-scan"
pat <-  'c[aeiou]+t'
regexprep(s, pat, '---')
regexprep(s, pat, '---', once = TRUE)
regexprep(s, pat, '---', ignorecase = TRUE)



