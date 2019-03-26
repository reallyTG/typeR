library(far)


### Name: orthonormalization
### Title: Orthonormalization of a set of a matrix
### Aliases: orthonormalization
### Keywords: algebra

### ** Examples

  mat1 <- matrix(c(1,0,1,1,1,0),nrow=3,ncol=2)
  orth1 <- orthonormalization(mat1, basis=FALSE, norm=FALSE)
  orth2 <- orthonormalization(mat1, basis=FALSE, norm=TRUE)
  orth3 <- orthonormalization(mat1, basis=TRUE, norm=TRUE)
  crossprod(orth1)
  crossprod(orth2)
  crossprod(orth3)



