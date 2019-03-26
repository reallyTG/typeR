library(kergp)


### Name: covMat-methods
### Title: Covariance Matrix for a Covariance Kernel Object
### Aliases: covMat,covMan-method covMat,covTS-method

### ** Examples

myCov <- covTS(inputs = c("Temp", "Humid", "Press"),
               kernel = "k1PowExp",
               dep = c(range = "cst", shape = "cst"),
               value = c(shape = 1.8, range = 1.1))
n <- 100; X <- matrix(runif(n*3), nrow = n, ncol = 3)
try(C1 <- covMat(myCov, X)) ## bad colnames
colnames(X) <- inputNames(myCov)
C2 <- covMat(myCov, X)

Xnew <- matrix(runif(n * 3), nrow = n, ncol = 3)
colnames(Xnew) <- inputNames(myCov)
C2 <- covMat(myCov, X, Xnew)

## check with the same matrix in 'X' and 'Xnew'
CMM <- covMat(myCov, X, X)
CM <- covMat(myCov, X)
max(abs(CM - CMM))



