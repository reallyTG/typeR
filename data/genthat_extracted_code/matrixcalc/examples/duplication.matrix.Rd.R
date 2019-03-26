library(matrixcalc)


### Name: duplication.matrix
### Title: Duplication matrix for n by n matrices
### Aliases: duplication.matrix
### Keywords: math

### ** Examples

D <- duplication.matrix( 3 )
A <- matrix( c( 1, 2, 3,
                2, 3, 4,
                3, 4, 5), nrow=3, byrow=TRUE )
vecA <- vec( A )
vechA<- vech( A )
y <- D %*% vechA
print( y )
print( vecA )



