library(SpatialTools)


### Name: decomp.cov
### Title: Calculates decomposition of covariance matrix
### Aliases: decomp.cov
### Keywords: covariance decomposition

### ** Examples

	data(toydata)
	U <- decomp.cov(toydata$V, method = "chol")
	#range(toydata$V - U %*% t(U))



