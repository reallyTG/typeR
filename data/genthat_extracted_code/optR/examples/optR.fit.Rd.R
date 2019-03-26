library(optR)


### Name: optR.fit
### Title: Fitter function for Linear/Non-linear system with form Ax=b
### Aliases: optR.fit

### ** Examples

# Solving equation Ax=b
A<-matrix(c(6,-4,1, -4,6,-4,1,-4,6), nrow=3,ncol=3, byrow = TRUE)
b<-matrix(c(-14,36, 6), nrow=3,ncol=1,byrow=TRUE)
Z<-optR(A, b, method="gauss") 

# Solve Linear model using LU decomposition (Supports Multi-response)
Z<-optR(A, b, method="LU")

# Solving the function using numerical method
Z<-optR(A, b, method="cgm")



