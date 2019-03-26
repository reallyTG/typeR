library(PTXQC)


### Name: shortenStrings
### Title: Shorten a string to a maximum length and indicate shorting by
###   appending '..'
### Aliases: shortenStrings

### ** Examples

r = shortenStrings(c("gamg_101", "gamg_101230100451", "jurkat_06_100731121305", "jurkat_06_1"))
all(r == c("gamg_101", "gamg_101230100..", "jurkat_06_1007..", "jurkat_06_1"))




