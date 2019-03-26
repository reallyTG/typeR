library(gamlss.dist)


### Name: NET
### Title: Normal Exponential t distribution (NET) for fitting a GAMLSS
### Aliases: NET dNET pNET qNET rNET
### Keywords: distribution regression

### ** Examples

NET()   # 
data(abdom)
plot(function(x)dNET(x, mu=0,sigma=1,nu=2, tau=3), -5, 5)
plot(function(x)pNET(x, mu=0,sigma=1,nu=2, tau=3), -5, 5) 
# fit NET with nu=1 and tau=3
# library(gamlss)
#h<-gamlss(y~cs(x,df=3), sigma.formula=~cs(x,1), family=NET, 
#        data=abdom, nu.start=2, tau.start=3) 
#plot(h)



