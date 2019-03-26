library(locpol)


### Name: compKernVals
### Title: Compute kernel values.
### Aliases: computeRK computeK4 computeMu computeMu0 computeMu Kconvol
###   'Compute kernel values'
### Keywords: nonparametric smooth

### ** Examples

	##	Note that lower and upper params are set in the definition to
	##	use 'dom()' function.
	g <- function(kernels)
	{
		mu0 <- sapply(kernels,function(x) computeMu0(x,))
		mu0.ok <- sapply(kernels,mu0K)
		mu2 <- sapply(kernels,function(x) computeMu(2,x))
		mu2.ok <- sapply(kernels,mu2K)
		Rk.ok <- sapply(kernels,RK)
		RK <- sapply(kernels,function(x) computeRK(x))
		K4 <- sapply(kernels,function(x) computeK4(x))
		res <- data.frame(mu0,mu0.ok,mu2,mu2.ok,RK,Rk.ok,K4)
		res
	}
	g(kernels=c(EpaK,gaussK,TriweigK,TrianK))



