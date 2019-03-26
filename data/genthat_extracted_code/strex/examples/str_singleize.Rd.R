library(strex)


### Name: str_singleize
### Title: Remove back-to-back duplicates of a pattern in a string.
### Aliases: str_singleize

### ** Examples

str_singleize("abc//def", "/")
str_singleize("abababcabab", "ab")
str_singleize(c("abab", "cdcd"), "cd")
str_singleize(c("abab", "cdcd"), c("ab", "cd"))



