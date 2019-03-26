library(onlinePCA)


### Name: sgapca
### Title: Stochastic Gradient Ascent PCA
### Aliases: sgapca

### ** Examples

## Initialization
n <- 1e4  # sample size
n0 <- 5e3 # initial sample size
d <- 10   # number of variables
q <- d # number of PC to compute
x <- matrix(runif(n*d), n, d)
x <- x %*% diag(sqrt(12*(1:d)))
# The eigenvalues of x are close to 1, 2, ..., d
# and the corresponding eigenvectors are close to 
# the canonical basis of R^d

## SGA PCA
xbar <- colMeans(x[1:n0,])
pca <- batchpca(x[1:n0,], q, center=xbar, byrow=TRUE)
for (i in (n0+1):n) {
  xbar <- updateMean(xbar, x[i,], i-1)
  pca <- sgapca(pca$values, pca$vectors, x[i,], 2/i, q, xbar)
}
pca



