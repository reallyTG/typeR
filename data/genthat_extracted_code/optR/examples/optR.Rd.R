library(optR)


### Name: optR
### Title: Optimization & predictive modelling Toolsets
### Aliases: optR

### ** Examples

# Solving equation Ax=b
A<-matrix(c(6,-4,1, -4,6,-4,1,-4,6), nrow=3,ncol=3, byrow = TRUE)
b<-matrix(c(-14,36, 6), nrow=3,ncol=1,byrow=TRUE)
Z<-optR(A, b, method="gauss") # Solve Linear model using Gauss Elimination

# Solve Linear model using LU decomposition (Supports Multi-response)
Z<-optR(A, b, method="LU") 

# Solve the matrix using Gauss Elimination (1, -1, 2)
A<-matrix(c(2,-2,6, -2,4,3,-1,8,4), nrow=3,ncol=3, byrow = TRUE)
b<-matrix(c(16,0, -1), nrow=3,ncol=1,byrow=TRUE)
Z<-optR(A, b, method="gauss") # Solve Linear model using Gauss Elimination

require(utils)
set.seed(129)
n <- 10 ; p <- 4
X <- matrix(rnorm(n * p), n, p) # no intercept!
y <- rnorm(n)
Z<-optR(X, y, method="cgm")



