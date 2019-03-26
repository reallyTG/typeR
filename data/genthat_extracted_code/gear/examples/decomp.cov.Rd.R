library(gear)


### Name: decomp.cov
### Title: Decompose covariance matrix
### Aliases: decomp.cov

### ** Examples

# generate data
n = 100
coords = matrix(runif(n*2), nrow = n, ncol = 2)
d = as.matrix(dist(coords))
# create covariance matrix
v = 3*exp(-d/2) + 0.1*diag(n)

# decompose v using the three methods
d1 = decomp.cov(v, "chol")
d2 = decomp.cov(v, "eigen")
d3 = decomp.cov(v, "svd")

# verify accuracy of decompositions
range(v - tcrossprod(d1))
range(v - tcrossprod(d2))
range(v - tcrossprod(d3))



