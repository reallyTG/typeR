library(gnlm)


### Name: nlr
### Title: Nonlinear Normal, Gamma, and Inverse Gaussian Regression Models
### Aliases: nlr
### Keywords: models

### ** Examples


x <- c(3,5,0,0,0,3,2,2,2,7,4,0,0,2,2,2,0,1,3,4)
y <- c(5.8,11.6,2.2,2.7,2.3,9.4,11.7,3.3,1.5,14.6,9.6,7.4,10.7,6.9,
	2.6,17.3,2.8,1.2,1.0,3.6)
# rgamma(20,2,scale=0.2+2*exp(0.1*x))
# linear least squares regression
mu1 <- function(p) p[1]+p[2]*x
summary(lm(y~x))
nlr(y, mu=mu1, pmu=c(3,0))
# or
nlr(y, mu=~x, pmu=c(3,0))
# or
nlr(y, mu=~b0+b1*x, pmu=c(3,0))
# linear gamma regression
nlr(y, dist="gamma", mu=~x, pmu=c(3,0))
# nonlinear regression
mu2 <- function(p) p[1]+p[2]*exp(p[3]*x)
nlr(y, mu=mu2, pmu=c(0.2,3,0.2))
# or
nlr(y, mu=~b0+c0*exp(c1*x), pmu=list(b0=0.2,c0=3,c1=0.2))
# with gamma distribution
nlr(y, dist="gamma", mu=~b0+c0*exp(c1*x), pmu=list(b0=0.2,c0=3,c1=0.2))




