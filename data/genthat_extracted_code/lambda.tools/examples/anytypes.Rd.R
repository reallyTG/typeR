library(lambda.tools)


### Name: anytypes
### Title: Show the types of a list or data.frame
### Aliases: anytypes
### Keywords: attribute

### ** Examples

x <- data.frame(ints=1:3, chars=c('a','b','c'), nums=c(.1,.2,.3))
anytypes(x)

x <- list(ints=1:4, chars=c('a','b','c'), nums=c(.1,.2,.3))
anytypes(x)



