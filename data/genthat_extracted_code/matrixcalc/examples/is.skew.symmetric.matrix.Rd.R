library(matrixcalc)


### Name: is.skew.symmetric.matrix
### Title: Test for a skew-symmetric matrix
### Aliases: is.skew.symmetric.matrix
### Keywords: math

### ** Examples

A <- diag( 1, 3 )
is.skew.symmetric.matrix( A )
B <- matrix( c( 0, -2, -1, -2, 0, -4, 1, 4, 0 ), nrow=3, byrow=TRUE )
is.skew.symmetric.matrix( B )
C <- matrix( c( 0, 2, 1, 2, 0, 4, 1, 4, 0 ), nrow=3, byrow=TRUE )
is.skew.symmetric.matrix( C )



