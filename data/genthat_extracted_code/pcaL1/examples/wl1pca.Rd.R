library(pcaL1)


### Name: wl1pca
### Title: wPCA
### Aliases: wl1pca

### ** Examples

##for 100x10 data matrix X, 
## lying (mostly) in the subspace defined by the first 2 unit vectors, 
## projects data into 1 dimension.
X <- matrix(c(runif(100*2, -10, 10), rep(0,100*8)),nrow=100) +
               matrix(c(rep(0,100*2),rnorm(100*8,0,0.1)),ncol=10)
mywl1pca <- wl1pca(X)

##projects data into 2 dimensions.
mywl1pca <- wl1pca(X, projDim=2, center=FALSE)

## plot first two scores
plot(mywl1pca$scores)



