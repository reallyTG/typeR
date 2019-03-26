library(SpatialTools)


### Name: cov.st
### Title: Calculates spatio-temporal covariance
### Aliases: cov.st
### Keywords: covariance spatial time spatio-temporal

### ** Examples

	coords <- matrix(rnorm(30), ncol = 3)
	pcoords <- matrix(rnorm(90), ncol = 3)
	time <- 1:10
	ptime <- 1:30
	cov.st(coords = coords, time = time, sp.type = "exponential", 
	    sp.par = c(2, 1), error.var = 1, t.type = "ar1", t.par = .5, 
	    pcoords = pcoords, ptime = ptime)



