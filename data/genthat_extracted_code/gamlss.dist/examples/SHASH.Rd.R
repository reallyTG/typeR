library(gamlss.dist)


### Name: SHASH
### Title: The Sinh-Arcsinh (SHASH) distribution for fitting a GAMLSS
### Aliases: SHASH dSHASH pSHASH qSHASH rSHASH SHASHo dSHASHo pSHASHo
###   qSHASHo rSHASHo SHASHo2 dSHASHo2 pSHASHo2 qSHASHo2 rSHASHo2
### Keywords: distribution regression

### ** Examples

SHASH()   # 
plot(function(x)dSHASH(x, mu=0,sigma=1, nu=1, tau=2), -5, 5, 
 main = "The SHASH  density mu=0,sigma=1,nu=1, tau=2")
plot(function(x) pSHASH(x, mu=0,sigma=1,nu=1, tau=2), -5, 5, 
 main = "The BCPE  cdf mu=0, sigma=1, nu=1, tau=2")
dat<-rSHASH(100,mu=10,sigma=1,nu=1,tau=1.5)
hist(dat)
# library(gamlss)
# gamlss(dat~1,family=SHASH, control=gamlss.control(n.cyc=30))



