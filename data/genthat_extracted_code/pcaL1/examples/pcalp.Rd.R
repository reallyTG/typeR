library(pcaL1)


### Name: pcalp
### Title: PCA-Lp
### Aliases: pcalp

### ** Examples
  
##for 100x10 data matrix X, 
## lying (mostly) in the subspace defined by the first 2 unit vectors, 
## projects data into 1 dimension.
X <- matrix(c(runif(100*2, -10, 10), rep(0,100*8)),nrow=100) 
               + matrix(c(rep(0,100*2),rnorm(100*8,0,0.1)),ncol=10)
mypcalp <- pcalp(X, p = 1.5)

##projects data into 2 dimensions.
mypcalp <- pcalp(X, projDim=2, p = 1.5, center=FALSE, projections="l1")

## plot first two scores
plot(mypcalp$scores)



