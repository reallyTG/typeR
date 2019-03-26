library(onlinePCA)


### Name: incRpca
### Title: Incremental PCA
### Aliases: incRpca

### ** Examples

## Simulate Brownian motion
n <- 100 # number of sample paths
d <- 50	 # number of observation points
q <- 10	 # number of PCs to compute
n0 <- 50 # number of sample paths used for initialization 
x <- matrix(rnorm(n*d,sd=1/sqrt(d)), n, d)
x <- t(apply(x,1,cumsum))	
dim(x) # (100,50)


## Incremental PCA (IPCA, centered)
pca <- prcomp(x[1:n0,]) # initialization
xbar <- pca$center
pca <- list(values=pca$sdev[1:q]^2, vectors=pca$rotation[,1:q])
for (i in (n0+1):n)
{
  xbar <- updateMean(xbar, x[i,], i-1)
  pca <- incRpca(pca$values, pca$vectors, x[i,], i-1, q = q,
		center = xbar)
}

## Incremental PCA (IPCA, uncentered)
pca <- prcomp(x[1:n0,],center=FALSE) # initialization
pca <- list(values = pca$sdev[1:q]^2, vectors = pca$rotation[,1:q])
for (i in (n0+1):n)
  pca <- incRpca(pca$values, pca$vectors, x[i,], i-1, q = q)



