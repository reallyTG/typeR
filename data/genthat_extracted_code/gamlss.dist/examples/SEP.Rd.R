library(gamlss.dist)


### Name: SEP
### Title: The Skew Power exponential (SEP) distribution for fitting a
###   GAMLSS
### Aliases: SEP dSEP pSEP qSEP rSEP
### Keywords: distribution regression

### ** Examples

SEP()   # 
plot(function(x)dSEP(x, mu=0,sigma=1, nu=1, tau=2), -5, 5, 
 main = "The SEP  density mu=0,sigma=1,nu=1, tau=2")
plot(function(x) pSEP(x, mu=0,sigma=1,nu=1, tau=2), -5, 5, 
 main = "The BCPE  cdf mu=0, sigma=1, nu=1, tau=2")
dat <- rSEP(100,mu=10,sigma=1,nu=-1,tau=1.5)
# library(gamlss)
# gamlss(dat~1,family=SEP, control=gamlss.control(n.cyc=30))



