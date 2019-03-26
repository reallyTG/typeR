library(logitnorm)


### Name: twCoefLogitnormMLE
### Title: twCoefLogitnormMLE
### Aliases: twCoefLogitnormMLE

### ** Examples


# estimate the parameters, with mode 0.7 and upper quantile 0.9
(theta <- twCoefLogitnormMLE(0.7,0.9))

x <- seq(0,1,length.out = 41)[-c(1,41)]	# plotting grid
px <- plogitnorm(x,mu = theta[1],sigma = theta[2])	#percentiles function
plot(px~x); abline(v = c(0.7,0.9),col = "gray"); abline(h = c(0.999),col = "gray")
dx <- dlogitnorm(x,mu = theta[1],sigma = theta[2])	#density function
plot(dx~x); abline(v = c(0.7,0.9),col = "gray")

# vectorized
(theta <- twCoefLogitnormMLE(mle = seq(0.4,0.8,by = 0.1),quant = 0.9))

# flat
(theta <- twCoefLogitnormMLEFlat(0.7))



