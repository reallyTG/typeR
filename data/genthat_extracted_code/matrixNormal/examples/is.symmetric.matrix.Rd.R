library(matrixNormal)


### Name: is.symmetric.matrix
### Title: Is a matrix symmetric or positive-definite?
### Aliases: is.symmetric.matrix is.square.matrix is.positive.semi.definite
###   is.positive.definite
### Keywords: matrix

### ** Examples

## Example 0: Not square matrix
B <- matrix( c( 1, 2, 3, 4, 5, 6 ), nrow=2, byrow=TRUE )
B
is.square.matrix(B)

## Example 1: Not a matrix. should get an error.
## Not run: 
##D  df <- as.data.frame( matrix( c( 1, 2, 3, 4, 5, 6 ), nrow=2, byrow=TRUE ) )
##D df
##D is.square.matrix(df)
## End(Not run)

## Example 2: Not Symmetric & Compare against matrixcalc
if( !requireNamespace( "matrixcalc", quietly = TRUE)) { install.packages("matrixcalc") }
  F <- matrix( c( 1, 2, 3, 4 ), nrow=2, byrow=TRUE ); F
is.square.matrix(F)
is.symmetric.matrix( F )   #should be FALSE
matrixcalc::is.symmetric.matrix(F)
#Another Symmetric Test found in base. Because of this, is.symmetric() may not be needed
isSymmetric.matrix(F)

## Example 3: Symmetric but negative-definite. same test of functions
##' eigenvalues are  3 -1
G <- matrix( c( 1, 2, 2, 1 ), nrow=2, byrow=TRUE ); G
is.symmetric.matrix( G )
matrixcalc::is.symmetric.matrix(G)
isSymmetric.matrix(G)
is.positive.definite(G) #FALSE
is.positive.semi.definite(G) #FALSE

## Example 4: positive definite matrix
#' eigenvalues are 3.4142136 2.0000000 0.585786
Q <- matrix( c( 2, -1, 0, -1, 2, -1, 0, -1, 2 ), nrow=3, byrow=TRUE )
is.symmetric.matrix(Q)
is.positive.definite( Q )

## Example 5: identity matrix is always positive definite
I <- diag( 1, 3 )
is.square.matrix(I) #TRUE
is.symmetric.matrix(I) #TRUE
is.positive.definite( I ) #TRUE



