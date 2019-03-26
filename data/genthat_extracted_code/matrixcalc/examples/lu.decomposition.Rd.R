library(matrixcalc)


### Name: lu.decomposition
### Title: LU Decomposition of Square Matrix
### Aliases: lu.decomposition
### Keywords: math

### ** Examples

A <- matrix( c ( 1, 2, 2, 1 ), nrow=2, byrow=TRUE)
luA <- lu.decomposition( A )
L <- luA$L
U <- luA$U
print( L )
print( U )
print( L %*% U )
print( A )
B <- matrix( c( 2, -1, -2, -4, 6, 3, -4, -2, 8 ), nrow=3, byrow=TRUE )
luB <- lu.decomposition( B )
L <- luB$L
U <- luB$U
print( L )
print( U )
print( L %*% U )
print( B )



