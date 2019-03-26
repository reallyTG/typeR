library(optR)


### Name: cgm
### Title: Optimization & estimation based on Conjugate Gradient Method
### Aliases: cgm

### ** Examples

A<-matrix(c(4,-1,1, -1,4,-2,1,-2,4), nrow=3,ncol=3, byrow = TRUE)
b<-matrix(c(12,-1, 5), nrow=3,ncol=1,byrow=TRUE)
Z<-optR(A, b, method="cgm", iter=500, tol=1e-7)



