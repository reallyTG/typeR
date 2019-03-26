library(matrixcalc)


### Name: matrix.inverse
### Title: Inverse of a square matrix
### Aliases: matrix.inverse
### Keywords: math

### ** Examples

A <- matrix( c ( 1, 2, 2, 1 ), nrow=2, byrow=TRUE)
print( A )
invA <- matrix.inverse( A )
print( invA )
print( A %*% invA )
print( invA %*% A )



