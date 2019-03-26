library(onlinePCA)


### Name: ghapca
### Title: Generalized Hebbian Algorithm for PCA
### Aliases: ghapca

### ** Examples

## Initialization
n <- 1e4  # sample size
n0 <- 5e3 # initial sample size
d <- 10   # number of variables
q <- d # number of PC
x <- matrix(runif(n*d), n, d)
x <- x %*% diag(sqrt(12*(1:d)))
# The eigenvalues of X are close to 1, 2, ..., d
# and the corresponding eigenvectors are close to 
# the canonical basis of R^d

## GHA PCA
pca <- princomp(x[1:n0,])
xbar <- pca$center
pca <- list(values=pca$sdev[1:q]^2, vectors=pca$loadings[,1:q])
for (i in (n0+1):n) {
  xbar <- updateMean(xbar, x[i,], i-1)
  pca <- ghapca(pca$values, pca$vectors, x[i,], 2/i, q, xbar)
}



