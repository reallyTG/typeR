library(matrixcalc)


### Name: is.diagonal.matrix
### Title: Test for diagonal square matrix
### Aliases: is.diagonal.matrix
### Keywords: math

### ** Examples

A <- diag( 1, 3 )
is.diagonal.matrix( A )
B <- matrix( c( 1, 2, 3, 4 ), nrow=2, byrow=TRUE )
is.diagonal.matrix( B )
C <- matrix( c( 1, 0, 0, 0 ), nrow=2, byrow=TRUE )
is.diagonal.matrix( C )



