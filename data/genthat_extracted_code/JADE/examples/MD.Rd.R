library(JADE)


### Name: MD
### Title: Minimum Distance index MD
### Aliases: MD
### Keywords: multivariate

### ** Examples

S <- cbind(rt(1000, 4), rnorm(1000), runif(1000))
A <- matrix(rnorm(9), ncol = 3)
X <- S %*% t(A)

W.hat <- JADE(X, 3)$W
MD(W.hat, A)



