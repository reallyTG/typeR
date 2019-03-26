library(fdrtool)


### Name: halfnormal
### Title: The Half-Normal Distribution
### Aliases: halfnormal dhalfnorm phalfnorm qhalfnorm rhalfnorm sd2theta
###   theta2sd
### Keywords: distribution

### ** Examples

# load "fdrtool" library
library("fdrtool")


## density of half-normal compared with a corresponding normal
par(mfrow=c(1,2))

sd.norm = 0.64
x  = seq(0, 5, 0.01)
x2 = seq(-5, 5, 0.01)
plot(x, dhalfnorm(x, sd2theta(sd.norm)), type="l", xlim=c(-5, 5), lwd=2,
   main="Probability Density", ylab="pdf(x)")
lines(x2, dnorm(x2, sd=sd.norm), col=8 )


plot(x, phalfnorm(x, sd2theta(sd.norm)), type="l", xlim=c(-5, 5),  lwd=2,
   main="Distribution Function", ylab="cdf(x)")
lines(x2, pnorm(x2, sd=sd.norm), col=8 )

legend("topleft", 
c("half-normal", "normal"), lwd=c(2,1),
col=c(1, 8), bty="n", cex=1.0)

par(mfrow=c(1,1))


## distribution function

integrate(dhalfnorm, 0, 1.4, theta = 1.234)
phalfnorm(1.4, theta = 1.234)

## quantile function
qhalfnorm(-1) # NaN
qhalfnorm(0)
qhalfnorm(.5)
qhalfnorm(1)
qhalfnorm(2) # NaN

## random numbers
theta = 0.72
hz = rhalfnorm(10000, theta)
hist(hz, freq=FALSE)
lines(x, dhalfnorm(x, theta))

mean(hz) 
1/theta  # theoretical mean

var(hz)
(pi-2)/(2*theta*theta) # theoretical variance


## relationship with two-sided normal p-values
z = rnorm(1000)

# two-sided p-values
pvl = 1- phalfnorm(abs(z))
pvl2 = 2 - 2*pnorm(abs(z)) 
sum(pvl-pvl2)^2 # equivalent
hist(pvl2, freq=FALSE)  # uniform distribution

# back to half-normal scores
hz = qhalfnorm(1-pvl)
hist(hz, freq=FALSE)
lines(x, dhalfnorm(x))



