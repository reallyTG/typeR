library(sensitivity)


### Name: sobolSmthSpl
### Title: Estimation of Sobol' First Order Indices with B-spline Smoothing
### Aliases: sobolSmthSpl

### ** Examples

	X = matrix(runif(10000), ncol = 10)
	Y = sobol.fun(X)
	sa = sobolSmthSpl(Y, X)
	plot(sa)



