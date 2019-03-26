library(spam)


### Name: Coercion
### Title: Coercion to a Vector
### Aliases: as.vector.spam as.vector,spam-method
###   as.vector,spam.chol.NgPeyton-method
### Keywords: manip

### ** Examples

x <- diag(2)
ifelse( x, x, 1-x)
ifelse( x, as.vector(x), 1-as.vector(x))

x <- diag.spam(2)
options(spam.structurebased=FALSE)
ifelse( x, as.vector(x), 1-as.vector(x))
options(spam.structurebased=TRUE)
ifelse( x, as.vector(x), 1-as.vector(x))



