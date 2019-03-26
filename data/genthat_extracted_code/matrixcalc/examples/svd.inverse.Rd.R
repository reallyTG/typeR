library(matrixcalc)


### Name: svd.inverse
### Title: SVD Inverse of a square matrix
### Aliases: svd.inverse
### Keywords: math

### ** Examples

A <- matrix( c ( 1, 2, 2, 1 ), nrow=2, byrow=TRUE)
invA <- svd.inverse( A )
print( A )
print( invA )
print( A %*% invA )
B <- matrix( c( -1, 2, 2 ), nrow=1, byrow=TRUE )
invB <- svd.inverse( B )
print( B )
print( invB )
print( B %*% invB )



