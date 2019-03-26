library(matrixcalc)


### Name: is.idempotent.matrix
### Title: Test for idempotent square matrix
### Aliases: is.idempotent.matrix
### Keywords: math

### ** Examples

A <- diag( 1, 3 )
is.idempotent.matrix( A )
B <- matrix( c( 1, 2, 3, 4 ), nrow=2, byrow=TRUE )
is.idempotent.matrix( B )
C <- matrix( c( 1, 0, 0, 0 ), nrow=2, byrow=TRUE )
is.idempotent.matrix( C )



