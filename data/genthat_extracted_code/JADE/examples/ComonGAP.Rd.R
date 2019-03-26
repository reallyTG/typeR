library(JADE)


### Name: ComonGAP
### Title: Comon's Gap
### Aliases: ComonGAP
### Keywords: multivariate

### ** Examples

S <- cbind(rt(1000, 4), rnorm(1000), runif(1000))
A <- matrix(rnorm(9), ncol = 3)
X <- S %*% t(A)

A.hat <- JADE(X, 3)$A
ComonGAP(A, A.hat)



