library(rrlda)


### Name: rrest
### Title: Robust Regularized Estimator (RegMCD) for location and inverse
###   scatter
### Aliases: rrest
### Keywords: file

### ** Examples

	x <- cbind(rnorm(100), rnorm(100), rnorm(100)) # use first group only
	rr <- rrest(x, lambda=0.2, hp=0.75)
	solve(rr$covi) ## estimated cov matrix



