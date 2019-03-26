library(bfw)


### Name: SingleString
### Title: Single String
### Aliases: SingleString

### ** Examples

A <- "This is a single string"
SingleString(A)
# [1] TRUE
is.character(A)
# [1] TRUE
B <- c("This is a vector" , "containing two strings")
SingleString(B)
# [1] FALSE
is.character(B)
# [1] TRUE



