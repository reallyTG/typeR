library(stringi)


### Name: stri_remove_empty
### Title: Remove all empty strings from a character vector
### Aliases: stri_remove_empty

### ** Examples

stri_remove_empty(stri_na2empty(c("a", NA, "", "b")))
stri_remove_empty(c("a", NA, "", "b"))
stri_remove_empty(c("a", NA, "", "b"), TRUE)




