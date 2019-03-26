library(logitnorm)


### Name: twCoefLogitnormE
### Title: twCoefLogitnormE
### Aliases: twCoefLogitnormE

### ** Examples

# estimate the parameters
(thetaE <- twCoefLogitnormE(0.7,0.9))

x <- seq(0,1,length.out = 41)[-c(1,41)]	# plotting grid
px <- plogitnorm(x,mu = thetaE[1],sigma = thetaE[2])	#percentiles function
plot(px~x); abline(v = c(0.7,0.9),col = "gray"); abline(h = c(0.5,0.975),col = "gray")
dx <- dlogitnorm(x,mu = thetaE[1],sigma = thetaE[2])	#density function
plot(dx~x); abline(v = c(0.7,0.9),col = "gray")

z <- rlogitnorm(1e5, mu = thetaE[1],sigma = thetaE[2])
mean(z)	# about 0.7

# vectorized
(theta <- twCoefLogitnormE(mean = seq(0.4,0.8,by = 0.1),quant = 0.9))



