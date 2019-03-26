library(matrixcalc)


### Name: is.singular.matrix
### Title: Test for singular square matrix
### Aliases: is.singular.matrix
### Keywords: math

### ** Examples

A <- diag( 1, 3 )
is.singular.matrix( A )
B <- matrix( c( 0, 0, 3, 4 ), nrow=2, byrow=TRUE )
is.singular.matrix( B )



