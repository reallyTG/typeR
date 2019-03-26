library(ADMM)


### Name: admm.spca
### Title: Sparse PCA
### Aliases: admm.spca

### ** Examples

## generate a random matrix and compute its sample covariance
X    = matrix(rnorm(1000*5),nrow=1000)
covX = cov(X)

## compute 3 sparse basis
output = admm.spca(covX, 3)




