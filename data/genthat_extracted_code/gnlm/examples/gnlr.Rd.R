library(gnlm)


### Name: gnlr
### Title: Generalized Nonlinear Regression Models for One and Two
###   Parameter Distributions
### Aliases: gnlr
### Keywords: models

### ** Examples


sex <- c(rep(0,10),rep(1,10))
sexf <- gl(2,10)
age <- c(8,10,12,12,8,7,16,7,9,11,8,9,14,12,12,11,7,7,7,12)
y <- cbind(c(9.2, 7.3,13.0, 6.9, 3.9,14.9,17.8, 4.8, 6.4, 3.3,17.2,
	14.4,17.0, 5.0,17.3, 3.8,19.4, 5.0, 2.0,19.0),
	c(0,1,0,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1))
# y <- cbind(rweibull(20,2,2+2*sex+age),rbinom(20,1,0.7))
# linear regression with inverse Gauss distribution
mu <- function(p) p[1]+p[2]*sex+p[3]*age
gnlr(y, dist="inverse Gauss", mu=mu, pmu=c(3,0,0), pshape=1)
# or equivalently
gnlr(y, dist="inverse Gauss", mu=~sexf+age, pmu=c(3,0,0), pshape=1)
# or
gnlr(y, dist="inverse Gauss", linear=~sexf+age, pmu=c(3,0,0), pshape=1)
# or
gnlr(y, dist="inverse Gauss", mu=~b0+b1*sex+b2*age,
	pmu=list(b0=3,b1=0,b2=0), pshape=1)
#
# nonlinear regression with inverse Gauss distribution
mu <- function(p, linear) exp(linear)
gnlr(y, dist="inverse Gauss", mu=mu, linear=~sexf+age, pmu=c(3,0,0),
	pshape=-1)
# or equivalently
gnlr(y, dist="inverse Gauss", mu=~exp(b0+b1*sex+b2*age),
	pmu=list(b0=3,b1=0,b2=0), pshape=-1)
# or
gnlr(y, dist="inverse Gauss", mu=~exp(linear), linear=~sexf+age,
	pmu=c(3,0,0), pshape=-1)
#
# include regression for the shape parameter with same mu function
shape <- function(p) p[1]+p[2]*sex+p[3]*age
gnlr(y, dist="inverse Gauss", mu=mu, linear=~sexf+age, shape=shape,
	pmu=c(3,0,0), pshape=c(3,0,0))
# or equivalently
gnlr(y, dist="inverse Gauss", mu=mu, linear=~sexf+age,
	shape=~sexf+age, pmu=c(3,0,0), pshape=c(3,0,0))
# or
gnlr(y, dist="inverse Gauss", mu=mu, linear=list(~sex+age,~sex+age),
	pmu=c(3,0,0),pshape=c(3,0,0))
# or
gnlr(y, dist="inverse Gauss", mu=mu, linear=~sex+age,
	shape=~c0+c1*sex+c2*age, pmu=c(3,0,0),
	pshape=list(c0=3,c1=0,c2=0))
#
# shape as a function of the location
shape <- function(p, mu) p[1]+p[2]*sex+p[3]*mu
gnlr(y, dist="inverse Gauss", mu=~age, shape=shape, pmu=c(3,0),
	pshape=c(3,0,0), shfn=TRUE)
# or
gnlr(y, dist="inverse Gauss", mu=~age, shape=~a+b*sex+c*mu, pmu=c(3,0),
	pshape=c(3,0,0), shfn=TRUE)
#
# common parameter in location and shape functions for age
mu <- function(p) exp(p[1]+p[2]*age)
shape <- function(p, mu) p[3]+p[4]*sex+p[2]*age
gnlr(y, dist="inverse Gauss", mu=mu, shape=shape, pmu=c(3,0,1,0),
	common=TRUE)
# or
gnlr(y, dist="inverse Gauss", mu=~exp(a+b*age), shape=~c+d*sex+b*age,
	pmu=c(3,0,1,0), common=TRUE)
#
# user-supplied -log likelihood function
y <- rnorm(20,2+3*sex,2)
dist <- function(p)-sum(dnorm(y,p[1]+p[2]*sex,p[3],log=TRUE))
gnlr(y, dist=dist,pmu=1:3)
dist <- ~-sum(dnorm(y,a+b*sex,v,log=TRUE))
gnlr(y, dist=dist,pmu=1:3)




