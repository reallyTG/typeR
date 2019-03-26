library(optR)


### Name: LU.decompose
### Title: LU decomposition
### Aliases: LU.decompose

### ** Examples

A<-matrix(c(0,-1,1, -1,2,-1,2,-1,0), nrow=3,ncol=3, byrow = TRUE)
Z<-optR(A, tol=1e-7, method="LU")



