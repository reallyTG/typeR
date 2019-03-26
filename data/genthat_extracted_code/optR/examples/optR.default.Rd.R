library(optR)


### Name: optR.default
### Title: Optimization & predictive modelling Toolsets
### Aliases: optR.default

### ** Examples

# Solving equation Ax=b
A<-matrix(c(6,-4,1, -4,6,-4,1,-4,6), nrow=3,ncol=3, byrow = TRUE)
b<-matrix(c(-14,36, 6), nrow=3,ncol=1,byrow=TRUE)
Z<-optR(A, b, method="gauss") 

# Solve Linear model using LU decomposition (Supports Multi-response)
Z<-optR(A, b, method="LU")

# Solving the function using numerical method
Z<-optR(A, b, method="cgm")

require(utils)
set.seed(129)
n <- 7 ; p <- 2
X <- matrix(rnorm(n * p), n, p) # no intercept!
y <- rnorm(n)
Z<-optR(X, y, method="LU")



