library(matrixcalc)


### Name: D.matrix
### Title: Duplication matrix
### Aliases: D.matrix
### Keywords: math

### ** Examples

D <- D.matrix( 3 )
A <- matrix( c( 1, 2, 3,
                2, 3, 4,
                3, 4, 5), nrow=3, byrow=TRUE )
vecA <- vec( A )
vechA<- vech( A )
y <- D %*% vechA
print( y )
print( vecA )



