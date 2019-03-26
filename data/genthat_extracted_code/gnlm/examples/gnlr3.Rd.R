library(gnlm)


### Name: gnlr3
### Title: Generalized Nonlinear Regression Models for Three Parameter
###   Distributions
### Aliases: gnlr3
### Keywords: models

### ** Examples


sex <- c(rep(0,10),rep(1,10))
sexf <- gl(2,10)
age <- c(8,10,12,12,8,7,16,7,9,11,8,9,14,12,12,11,7,7,7,12)
y <- cbind(c(9.2, 7.3,13.0, 6.9, 3.9,14.9,17.8, 4.8, 6.4, 3.3,17.2,
	14.4,17.0, 5.0,17.3, 3.8,19.4, 5.0, 2.0,19.0),
	c(0,1,0,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1))
# y <- cbind(rweibull(20,2,2+2*sex+age),rbinom(20,1,0.7))
# log linear regression with the generalized Weibull distribution
mu <- function(p) exp(p[1]+p[2]*sex+p[3]*age)
gnlr3(y, dist="Weibull", mu=mu, pmu=c(3,1,0), pshape=2, pfamily=-2)
# or equivalently
mu1 <- function(p,linear) exp(linear)
gnlr3(y, dist="Weibull", mu=mu1, linear=~sex+age, pmu=c(3,1,0),
	pshape=2, pfamily=-2)
# or
gnlr3(y, dist="Weibull", mu=~exp(b0+b1*sex+b2*age),
	pmu=list(b0=3,b1=1,b2=0), pshape=2, pfamily=-2)
#
# include regression for the shape parameter with same mu function
shape <- function(p) p[1]+p[2]*sex+p[3]*age
gnlr3(y, dist="Weibull", mu=mu, shape=shape,
	pmu=c(3,1,0), pshape=c(2,0,0), pfamily=-2)
# or equivalently
gnlr3(y, dist="Weibull", mu=mu1, linear=list(~sexf+age,~sex+age,NULL),
	pmu=c(3,1,0), pshape=c(2,0,0), pfamily=-2)
# or
gnlr3(y, dist="Weibull", mu=~exp(b0+b1*sex+b2*age),
	shape=~c0+c1*sex+c2*age, pmu=c(3,1,0),
	pshape=list(c0=2,c1=0,c2=0), pfamily=-2)
# include regression for the family parameter with same mu
# and shape functions
family <- function(p) p[1]+p[2]*sex+p[3]*age
gnlr3(y, dist="Weibull", mu=mu1, linear=~sexf+age, shape=shape,
	family=family, pmu=c(2.5,1,0), pshape=c(2,0,0), pfamily=c(-2,0,0))
# or equivalently
gnlr3(y, dist="Weibull", mu=mu1, linear=list(~sex+age,~sex+age,~sex+age),
	pmu=c(2.5,1,0), pshape=c(2,0,0), pfamily=c(-2,0,0))
# or
gnlr3(y, dist="Weibull", mu=~exp(b0+b1*sex+b2*age),
	shape=~c0+c1*sex+c2*age, family=~d0+d1*sex+d2*age,
	pmu=list(b0=2.5,b1=1,b2=0), pshape=list(c0=2,c1=0,c2=0),
	pfamily=list(d0=-2,d1=0,d2=0))
#
# common parameters
mu <- function(p) exp(p[1]+p[2]*sex+p[3]*age)
shape <- function(p) p[4]+p[5]*sex+p[3]*age
family <- function(p) p[6]+p[7]*sex+p[3]*age
gnlr3(y, dist="Weibull", mu=mu, shape=shape, family=family,
	pmu=c(2.5,1,0,1,0,1,0), common=TRUE)
# or
gnlr3(y, dist="Weibull", mu=~exp(a+b*sex+c*age), shape=~d+e*sex+c*age,
	family=~f+g*sex+c*age, pmu=c(2.5,1,0,1,0,1,0), common=TRUE)




