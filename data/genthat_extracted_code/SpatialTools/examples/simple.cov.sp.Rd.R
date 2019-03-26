library(SpatialTools)


### Name: simple.cov.sp
### Title: Calculates spatial covariance based on distance matrix
### Aliases: simple.cov.sp
### Keywords: covariance spatial

### ** Examples

	coords <- matrix(rnorm(30), ncol = 3)
	D <- dist1(coords)
	simple.cov.sp(D = D, sp.type = "exponential", sp.par = c(2, 1),
		error.var = 1, smoothness = 0.5, finescale.var = 0)



