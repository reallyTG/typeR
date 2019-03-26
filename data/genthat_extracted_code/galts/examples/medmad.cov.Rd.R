library(galts)


### Name: medmad.cov
### Title: Function for robust covariance matrix estimation.
### Aliases: medmad.cov

### ** Examples

	n <- 100
	c <- 0.20
	h <- n - n*c
	x1 <- rnorm(n,0,10)
	x2 <- rnorm(n,0,10)
	x3 <- rnorm(n,0,10)
	x4 <- rnorm(n,0,10)
	x1[(h + 1):n]<-rnorm(n-h, 100, 10)
	x2[(h + 1):n]<-rnorm(n-h, 100, 10)
	x3[(h + 1):n]<-rnorm(n-h, 100, 10)
	x4[(h + 1):n]<-rnorm(n-h, 100, 10)
	mat <- medmad.cov(cbind(x1, x2, x3, x4))
	print (mat)



