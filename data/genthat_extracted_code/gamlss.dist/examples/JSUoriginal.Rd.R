library(gamlss.dist)


### Name: JSUo
### Title: The original Johnson's Su distribution for fitting a GAMLSS
### Aliases: JSUo dJSUo pJSUo qJSUo rJSUo
### Keywords: distribution regression

### ** Examples

JSU()   
plot(function(x)dJSUo(x, mu=0,sigma=1,nu=-1, tau=.5), -4, 15, 
 main = "The JSUo  density mu=0,sigma=1,nu=-1, tau=.5")
plot(function(x) pJSUo(x, mu=0,sigma=1,nu=-1, tau=.5), -4, 15, 
 main = "The JSUo  cdf mu=0, sigma=1, nu=-1, tau=.5")
# library(gamlss)
# data(abdom)
# h<-gamlss(y~cs(x,df=3), sigma.formula=~cs(x,1), family=JSUo, 
#          data=abdom, method=mixed(2,20)) 
# plot(h)



