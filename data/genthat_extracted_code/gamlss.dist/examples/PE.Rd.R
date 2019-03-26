library(gamlss.dist)


### Name: PE
### Title: Power Exponential distribution for fitting a GAMLSS
### Aliases: PE dPE pPE qPE rPE PE2 dPE2 pPE2 qPE2 rPE2
### Keywords: distribution regression

### ** Examples

PE()# gives information about the default links for the Power Exponential distribution  
# library(gamlss)
# data(abdom)
# h1<-gamlss(y~cs(x,df=3), sigma.formula=~cs(x,1), family=PE, data=abdom) # fit
# h2<-gamlss(y~cs(x,df=3), sigma.formula=~cs(x,1), family=PE2, data=abdom) # fit 
# plot(h1)
# plot(h2)
# leptokurtotic
plot(function(x) dPE(x, mu=10,sigma=2,nu=1), 0.0, 20, 
 main = "The PE  density mu=10,sigma=2,nu=1")
# platykurtotic
plot(function(x) dPE(x, mu=10,sigma=2,nu=4), 0.0, 20, 
 main = "The PE  density mu=10,sigma=2,nu=4") 



