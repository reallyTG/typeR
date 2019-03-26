library(logitnorm)


### Name: twSigmaLogitnorm
### Title: twSigmaLogitnorm
### Aliases: twSigmaLogitnorm

### ** Examples

mle <- 0.8
(theta <- twSigmaLogitnorm(mle))
#
x <- seq(0,1,length.out = 41)[-c(1,41)]	# plotting grid
px <- plogitnorm(x,mu = theta[1],sigma = theta[2])	#percentiles function
plot(px~x); abline(v = c(mle),col = "gray")
dx <- dlogitnorm(x,mu = theta[1],sigma = theta[2])	#density function
plot(dx~x); abline(v = c(mle),col = "gray")
# vectorized
(theta <- twSigmaLogitnorm(mle = seq(0.401,0.8,by = 0.1)))



