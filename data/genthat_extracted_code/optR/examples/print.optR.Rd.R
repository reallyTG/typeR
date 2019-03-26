library(optR)


### Name: print.optR
### Title: print coefficients for optR class
### Aliases: print.optR

### ** Examples

# Solving equation Ax=b
A<-matrix(c(6,-4,1, -4,6,-4,1,-4,6), nrow=3,ncol=3, byrow = TRUE)
b<-matrix(c(-14,36, 6), nrow=3,ncol=1,byrow=TRUE)
Z<-optR(A, b, method="gauss")
print(Z)



