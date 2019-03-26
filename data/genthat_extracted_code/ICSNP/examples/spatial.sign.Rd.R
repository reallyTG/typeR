library(ICSNP)


### Name: spatial.sign
### Title: Spatial Signs
### Aliases: spatial.sign
### Keywords: multivariate nonparametric

### ** Examples

set.seed(654321)
cov.matrix <- matrix(c(3,2,1,2,4,-0.5,1,-0.5,2), ncol=3)
X <- rmvnorm(15, c(1,0,-1), cov.matrix)
spatial.sign(X)
spatial.sign(X, center=FALSE, shape=FALSE)
spatial.sign(X, center=colMeans(X), shape=cov(X))
rm(.Random.seed)



