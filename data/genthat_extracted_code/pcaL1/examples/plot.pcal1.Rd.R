library(pcaL1)


### Name: plot.pcal1
### Title: Plot a Pcal1 Object
### Aliases: plot.pcal1
### Keywords: multivariate

### ** Examples

##for a 100x10 data matrix X, 
## lying (mostly) in the subspace defined by the first 2 unit vectors, 
## projects data into 1 dimension.
X <- matrix(c(runif(100*2, -10, 10), rep(0,100*8)),nrow=100) 
               + matrix(c(rep(0,100*2),rnorm(100*8,0,0.1)),ncol=10)
mypcal1 <- pcal1(X)

##projects data into 2 dimensions.
mypcal1 <- pcal1(X, projDim=2, center=FALSE, projections="l1")

## plot first two scores
plot(mypcal1$scores)



