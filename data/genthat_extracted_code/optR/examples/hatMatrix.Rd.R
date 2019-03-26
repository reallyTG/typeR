library(optR)


### Name: hatMatrix
### Title: Function determines the Hat matrix or projection matrix for
###   given X
### Aliases: hatMatrix

### ** Examples

X<-matrix(c(6,-4,1, -4,6,-4,1,-4,6), nrow=3,ncol=3, byrow = TRUE)
covmat <- matrix(rnorm(3 * 3), 3, 3)
H<-hatMatrix(X)
H<-hatMatrix(X, covmat)
diag(H)



