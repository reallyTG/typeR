library(kergp)


### Name: varVec-methods
### Title: Covariance Matrix for a Covariance Kernel Object
### Aliases: varVec,covMan-method varVec,covTS-method

### ** Examples

myCov <- covTS(inputs = c("Temp", "Humid", "Press"),
               kernel = "k1PowExp",
               dep = c(range = "cst", shape = "cst"),
               value = c(shape = 1.8, range = 1.1))
n <- 100; X <- matrix(runif(n*3), nrow = n, ncol = 3)
try(V1 <- varVec(myCov, X = X)) ## bad colnames
colnames(X) <- inputNames(myCov)
V2 <- varVec(myCov, X = X)

Xnew <- matrix(runif(n * 3), nrow = n, ncol = 3)
colnames(Xnew) <- inputNames(myCov)
V2 <- varVec(myCov, X = X)




