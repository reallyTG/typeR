library(pcaL1)


### Name: sharpel1pca
### Title: SharpEl1-PCA
### Aliases: sharpel1pca
### Keywords: multivariate

### ** Examples

##for a 100x10 data matrix X, 
## lying (mostly) in the subspace defined by the first 2 unit vectors, 
## projects data into 1 dimension.
X <- matrix(c(runif(100*2, -10, 10), rep(0,100*8)),nrow=100) +
                matrix(c(rep(0,100*2),rnorm(100*8,0,0.1)),ncol=10)
mysharpel1pca <- sharpel1pca(X)

##projects data into 2 dimensions.
mysharpel1pca <- sharpel1pca(X, projDim=2, center=FALSE, projections="l1")

## plot first two scores
plot(mysharpel1pca$scores)



