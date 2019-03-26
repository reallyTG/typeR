library(gamlss.dist)


### Name: BCT
### Title: Box-Cox t distribution for fitting a GAMLSS
### Aliases: BCT dBCT pBCT qBCT rBCT BCTuntr BCTo dBCTo pBCTo qBCTo rBCTo
### Keywords: distribution regression

### ** Examples

BCT()   # gives information about the default links for the Box Cox t distribution
# library(gamlss)
#data(abdom)
#h<-gamlss(y~cs(x,df=3), sigma.formula=~cs(x,1), family=BCT, data=abdom) # 
#plot(h)
plot(function(x)dBCT(x, mu=5,sigma=.5,nu=1, tau=2), 0.0, 20, 
 main = "The BCT  density mu=5,sigma=.5,nu=1, tau=2")
plot(function(x) pBCT(x, mu=5,sigma=.5,nu=1, tau=2), 0.0, 20, 
 main = "The BCT  cdf mu=5, sigma=.5, nu=1, tau=2")



