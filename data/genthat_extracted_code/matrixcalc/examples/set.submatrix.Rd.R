library(matrixcalc)


### Name: set.submatrix
### Title: Store matrix inside another matrix
### Aliases: set.submatrix
### Keywords: math

### ** Examples

x <- matrix( seq( 1, 16, 1 ), nrow=4, byrow=TRUE )
y <- matrix( seq( 1, 4, 1 ), nrow=2, byrow=TRUE )
z <- set.submatrix( x, y, 3, 3 )



