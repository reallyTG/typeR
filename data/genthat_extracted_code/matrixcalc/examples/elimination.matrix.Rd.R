library(matrixcalc)


### Name: elimination.matrix
### Title: Elimination matrix for lower triangular matrices
### Aliases: elimination.matrix
### Keywords: math

### ** Examples

L <- elimination.matrix( 4 )
A <- lower.triangle( matrix( seq( 1, 16, 1 ), nrow=4, byrow=TRUE ) )
vecA <- vec( A )
vechA <- vech( A )
y <- L %*% vecA
print( y )
print( vechA )



