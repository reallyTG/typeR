library(gamlss.dist)


### Name: EGB2
### Title: The exponential generalized Beta type 2 distribution for fitting
###   a GAMLSS
### Aliases: EGB2 dEGB2 pEGB2 qEGB2 rEGB2
### Keywords: distribution regression

### ** Examples

EGB2()   # 
y<- rEGB2(200, mu=5, sigma=2, nu=1, tau=4)
library(MASS)
truehist(y)
fx<-dEGB2(seq(min(y), 20, length=200), mu=5 ,sigma=2, nu=1, tau=4)
lines(seq(min(y),20,length=200),fx)
# something funny here
# library(gamlss)
# histDist(y, family=EGB2, n.cyc=60)
integrate(function(x) x*dEGB2(x=x, mu=5, sigma=2, nu=1, tau=4), -Inf, Inf)
curve(dEGB2(x, mu=5 ,sigma=2, nu=1, tau=4), -10, 10, main = "The EGB2  density 
             mu=5, sigma=2, nu=1, tau=4")



