library(pracma)


### Name: strfind
### Title: Find Substrings
### Aliases: strfind strfindi findstr
### Keywords: string

### ** Examples

S <- c("", "ab", "aba", "aba aba", "abababa")
s <- "aba"
strfind(S, s)
strfindi(toupper(S), s)
strfind(S, s, overlap = FALSE)



