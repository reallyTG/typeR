library(matrixcalc)


### Name: is.non.singular.matrix
### Title: Test if matrix is non-singular
### Aliases: is.non.singular.matrix
### Keywords: math

### ** Examples

A <- diag( 1, 3 )
is.non.singular.matrix( A )
B <- matrix( c( 0, 0, 3, 4 ), nrow=2, byrow=TRUE )
is.non.singular.matrix( B )



