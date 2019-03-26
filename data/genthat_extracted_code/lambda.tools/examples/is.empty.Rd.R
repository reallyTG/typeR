library(lambda.tools)


### Name: is.empty
### Title: Check whether data is bad or empty
### Aliases: is.bad is.empty
### Keywords: attribute

### ** Examples

a <- data.frame(a=NULL, b=NULL)
is.bad(a)

b <- list(a=1:3, b=NULL, c=NA, d='foo')
is.bad(b)

c <- list()
is.empty(c)



