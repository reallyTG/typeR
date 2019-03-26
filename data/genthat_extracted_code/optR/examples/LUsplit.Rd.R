library(optR)


### Name: LUsplit
### Title: Function to extract Lower and Upper matrix from LU decomposition
### Aliases: LUsplit

### ** Examples

A<-matrix(c(0,-1,1, -1,2,-1,2,-1,0), nrow=3,ncol=3, byrow = TRUE) 
Z<-optR(A, method="LU")
LUsplit(Z$U)



