library(gamlss.dist)


### Name: GB2
### Title: The generalized Beta type 2 and generalized Pareto distributions
###   for fitting a GAMLSS
### Aliases: GB2 dGB2 pGB2 qGB2 rGB2 dGP pGP qGP rGP GP
### Keywords: distribution regression

### ** Examples

GB2()   # 
y<- rGB2(200, mu=5, sigma=2, nu=1, tau=1)
library(MASS)
truehist(y)
fx<-dGB2(seq(0.01, 20, length=200), mu=5 ,sigma=2, nu=1, tau=1)
lines(seq(0.01,20,length=200),fx)
integrate(function(x) x*dGB2(x=x, mu=5, sigma=2, nu=1, tau=1), 0, Inf)
mean(y)
curve(dGB2(x, mu=5 ,sigma=2, nu=1, tau=1), 0.01, 20, 
            main = "The GB2  density mu=5, sigma=2, nu=1, tau=4")



