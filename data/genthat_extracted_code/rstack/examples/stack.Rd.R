library(rstack)


### Name: stack
### Title: A stack data type, implemented as an R6 class
### Aliases: stack
### Keywords: datasets

### ** Examples

S <- stack$new()
S$push(1L)
S$peek()
S$pop()
S$size()

S$push(NULL)
S$push(iris)
colnames(S$peek())



