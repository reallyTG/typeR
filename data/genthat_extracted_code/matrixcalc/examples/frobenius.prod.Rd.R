library(matrixcalc)


### Name: frobenius.prod
### Title: Frobenius innter product of matrices
### Aliases: frobenius.prod
### Keywords: math

### ** Examples

x <- matrix( c( 1, 2, 3, 4 ), nrow=2, byrow=TRUE )
y <- matrix( c( 2, 4, 6, 8 ), nrow=2, byrow=TRUE )
z <- frobenius.prod( x, y )
print( z )



