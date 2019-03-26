library(optR)


### Name: LU.optR
### Title: Solving system of equations using LU decomposition
### Aliases: LU.optR

### ** Examples

A<-matrix(c(0,-1,1, -1,2,-1,2,-1,0), nrow=3,ncol=3, byrow = TRUE)
b<-matrix(c(0,0, 1), nrow=3,ncol=1,byrow=TRUE)
Z<-optR(A, b, method="LU")



