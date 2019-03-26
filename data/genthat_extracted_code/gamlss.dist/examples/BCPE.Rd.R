library(gamlss.dist)


### Name: BCPE
### Title: Box-Cox Power Exponential distribution for fitting a GAMLSS
### Aliases: BCPE dBCPE pBCPE qBCPE rBCPE BCPEuntr checkBCPE BCPEo dBCPEo
###   pBCPEo qBCPEo rBCPEo
### Keywords: distribution regression

### ** Examples

# BCPE()   #
# library(gamlss) 
# data(abdom)
#h<-gamlss(y~cs(x,df=3), sigma.formula=~cs(x,1), family=BCPE, data=abdom) 
#plot(h)
plot(function(x)dBCPE(x, mu=5,sigma=.5,nu=1, tau=3), 0.0, 15, 
 main = "The BCPE  density mu=5,sigma=.5,nu=1, tau=3")
plot(function(x) pBCPE(x, mu=5,sigma=.5,nu=1, tau=3), 0.0, 15, 
 main = "The BCPE  cdf mu=5, sigma=.5, nu=1, tau=3")



