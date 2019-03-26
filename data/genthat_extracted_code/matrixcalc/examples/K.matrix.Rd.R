library(matrixcalc)


### Name: K.matrix
### Title: K Matrix
### Aliases: K.matrix
### Keywords: math

### ** Examples

K <- K.matrix( 3, 4 )
A <- matrix( seq( 1, 12, 1 ), nrow=3, byrow=TRUE )
vecA <- vec( A )
vecAt <- vec( t( A ) )
y <- K %*% vecA
print( y )
print( vecAt )



