library(stringi)


### Name: stri_flatten
### Title: Flatten a String
### Aliases: stri_flatten

### ** Examples

stri_flatten(LETTERS)
stri_flatten(LETTERS, collapse=",")
stri_flatten(c('abc', '123', '\u0105\u0104'))
stri_flatten(stri_dup(letters[1:6],1:3))
stri_flatten(c(NA, "", "A", "", "B", NA, "C"), collapse=",", na_empty=TRUE, omit_empty=TRUE)




