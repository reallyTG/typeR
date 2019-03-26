library(matrixcalc)


### Name: L.matrix
### Title: Construct L Matrix
### Aliases: L.matrix
### Keywords: math

### ** Examples

L <- L.matrix( 4 )
A <- lower.triangle( matrix( seq( 1, 16, 1 ), nrow=4, byrow=TRUE ) )
vecA <- vec( A )
vechA <- vech( A )
y <- L %*% vecA
print( y )
print( vechA )



