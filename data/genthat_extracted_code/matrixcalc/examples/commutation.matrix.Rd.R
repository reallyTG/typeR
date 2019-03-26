library(matrixcalc)


### Name: commutation.matrix
### Title: Commutation matrix for r by c numeric matrices
### Aliases: commutation.matrix
### Keywords: math

### ** Examples

K <- commutation.matrix( 3, 4 )
A <- matrix( seq( 1, 12, 1 ), nrow=3, byrow=TRUE )
vecA <- vec( A )
vecAt <- vec( t( A ) )
print( K %*% vecA )
print( vecAt )



