library(matlib)


### Name: svdDemo
### Title: Demonstrate the SVD for a 3 x 3 matrix
### Aliases: svdDemo

### ** Examples

A <- matrix(c(1,2,0.1, 0.1,1,0.1, 0.1,0.1,0.5), 3,3)
svdDemo(A)

## Not run: 
##D B <- matrix(c( 1, 0, 1, 0, 2, 0,  1, 0, 2), 3, 3)
##D svdDemo(B)
##D 
##D # a positive, semi-definite matrix with eigenvalues 12, 6, 0
##D C <- matrix(c(7, 4, 1,  4, 4, 4,  1, 4, 7), 3, 3)
##D svdDemo(C)
## End(Not run)




