library(gamlss.dist)


### Name: JSU
### Title: The Johnson's Su distribution for fitting a GAMLSS
### Aliases: JSU dJSU pJSU qJSU rJSU
### Keywords: distribution regression

### ** Examples

JSU()   
plot(function(x)dJSU(x, mu=0,sigma=1,nu=-1, tau=.5), -4, 4, 
 main = "The JSU  density mu=0,sigma=1,nu=-1, tau=.5")
plot(function(x) pJSU(x, mu=0,sigma=1,nu=-1, tau=.5), -4, 4, 
 main = "The JSU  cdf mu=0, sigma=1, nu=-1, tau=.5")
# library(gamlss)
# data(abdom) 
# h<-gamlss(y~cs(x,df=3), sigma.formula=~cs(x,1), family=JSU, data=abdom) 



