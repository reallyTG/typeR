library(logitnorm)


### Name: twCoefLogitnorm
### Title: twCoefLogitnorm
### Aliases: twCoefLogitnorm

### ** Examples

# estimate the parameters, with median at 0.7 and upper quantile at 0.9
(theta <- twCoefLogitnorm(0.7,0.9))

x <- seq(0,1,length.out = 41)[-c(1,41)]	# plotting grid
px <- plogitnorm(x,mu = theta[1],sigma = theta[2])	#percentiles function
plot(px~x); abline(v = c(0.7,0.9),col = "gray"); abline(h = c(0.5,0.975),col = "gray")

dx <- dlogitnorm(x,mu = theta[1],sigma = theta[2])	#density function
plot(dx~x); abline(v = c(0.7,0.9),col = "gray")

# vectorized
(theta <- twCoefLogitnorm(seq(0.4,0.8,by = 0.1),0.9))



