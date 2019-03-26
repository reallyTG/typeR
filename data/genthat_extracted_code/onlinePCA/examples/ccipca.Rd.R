library(onlinePCA)


### Name: ccipca
### Title: Candid Covariance-Free Incremental PCA
### Aliases: ccipca

### ** Examples

## Simulation of Brownian motion
n <- 100 # number of paths
d <- 50	 # number of observation points
q <- 10	 # number of PCs to compute
x <- matrix(rnorm(n*d,sd=1/sqrt(d)), n, d)
x <- t(apply(x,1,cumsum))	

## Initial PCA
n0 <- 50
pca <- princomp(x[1:n0,])
xbar <- pca$center
pca <- list(values=pca$sdev^2, vectors=pca$loadings)

## Incremental PCA
for (i in n0:(n-1))
{	xbar <- updateMean(xbar, x[i+1,], i)
  	pca <- ccipca(pca$values, pca$vectors, x[i+1,], i, q = q, center = xbar) }

# Uncentered PCA
nx1 <- sqrt(sum(x[1,]^2))
pca <- list(values=nx1^2, vectors=as.matrix(x[1,]/nx1))
for (i in n0:(n-1))
  	pca <- ccipca(pca$values, pca$vectors, x[i+1,], i, q = q)




