library(optR)


### Name: inv.optR
### Title: Invert a matrix using LU decomposition
### Aliases: inv.optR

### ** Examples

# Invert the matrix using LU decomposition
A<-matrix(c(0.6,-0.4,1, -0.3,0.2,0.5,0.6,-1,0.5), nrow=3,ncol=3, byrow = TRUE) 
InvA<-inv.optR(A)



