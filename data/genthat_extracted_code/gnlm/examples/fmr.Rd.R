library(gnlm)


### Name: fmr
### Title: Generalized Nonlinear Regression Models with Two or Three Point
###   Mixtures
### Aliases: fmr
### Keywords: models

### ** Examples


sex <- c(rep(0,10),rep(1,10))
sexf <- gl(2,10)
age <- c(8,10,12,12,8,7,16,7,9,11,8,9,14,12,12,11,7,7,7,12)
y <- cbind(c(9.2, 7.3,13.0, 6.9, 3.9,14.9,17.8, 4.8, 6.4, 3.3,17.2,
	14.4,17.0, 5.0,17.3, 3.8,19.4, 5.0, 2.0,19.0),
	c(0,1,0,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1))
# y <- cbind(rweibull(20,2,2+2*sex+age),rbinom(20,1,0.7))
# log linear regression with Weibull distribution with a point mass
#   for right censored individuals
mu <- function(p) exp(p[1]+p[2]*sex+p[3]*age)
fmr(y, dist="Weibull", mu=mu, pmu=c(4,0,0), pmix=0.5, pshape=1)
# or equivalently
fmr(y, dist="Weibull", mu=function(p,linear) exp(linear),
	linear=~sexf+age, pmu=c(4,0,0), pmix=0.5, pshape=1)
# or
fmr(y, dist="Weibull", mu=~exp(b0+b1*sex+b2*age), pmu=list(b0=4,b1=0,b2=0),
	pmix=0.5, pshape=1)
#
# include logistic regression for the mixture parameter
mix <- function(p) p[1]+p[2]*sex
fmr(y, dist="Weibull", mu=~exp(a+b*age), mix=mix, pmu=c(4,0),
	pmix=c(10,0), pshape=0.5)
# or equivalently
fmr(y, dist="Weibull", mu=function(p,linear) exp(linear),
	linear=list(~age,~sexf), pmu=c(4,0), pmix=c(10,0), pshape=0.5)
# or
fmr(y, dist="Weibull", mu=~exp(b0+b1*age), mix=~c0+c1*sex,
	pmu=list(b0=4,b1=0), pmix=list(c0=10,c1=0), pshape=0.5)
#
# generate zero-inflated negative binomial data
x1 <- rpois(50,4)
x2 <- rpois(50,4)
ind <- rbinom(50,1,1/(1+exp(-1-0.1*x1)))
y <- ifelse(ind,rnbinom(50,3,mu=exp(1+0.2*x2)),0)
# standard Poisson models
gnlr(y, dist="Poisson", mu=~exp(a), pmu=1)
gnlr(y, dist="Poisson", mu=~exp(linear), linear=~x2, pmu=c(1,0.2))
# zero-inflated Poisson ZIP
fmr(y, dist="Poisson", mu=~exp(a), pmu=1, pmix=0)
fmr(y, dist="Poisson", mu=~exp(linear), linear=~x2, pmu=c(1,0.2), pmix=0)
fmr(y, dist="Poisson", mu=~exp(a), mix=~x1, pmu=1, pmix=c(1,0))
fmr(y, dist="Poisson", mu=~exp(linear), linear=~x2, mix=~x1, pmu=c(1,0.2),
	pmix=c(1,0))
# zero-inflated negative binomial
fmr(y, dist="negative binomial", mu=~exp(a), pmu=1, pshape=0, pmix=0)
fmr(y, dist="negative binomial", mu=~exp(linear), linear=~x2, pmu=c(1,0.2),
	pshape=0, pmix=0)
fmr(y, dist="negative binomial", mu=~exp(a), mix=~x1, pmu=1, pshape=0,
       pmix=c(1,0))
fmr(y, dist="negative binomial", mu=~exp(linear), linear=~x2, mix=~x1,
	pmu=c(1,0.2), pshape=0, pmix=c(1,0))




