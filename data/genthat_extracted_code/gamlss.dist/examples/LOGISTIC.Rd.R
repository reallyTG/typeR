library(gamlss.dist)


### Name: LO
### Title: Logistic distribution for fitting a GAMLSS
### Aliases: LO dLO pLO qLO rLO
### Keywords: distribution regression

### ** Examples

LO()# gives information about the default links for the Logistic distribution 
plot(function(y) dLO(y, mu=10 ,sigma=2), 0, 20)
plot(function(y) pLO(y, mu=10 ,sigma=2), 0, 20)
plot(function(y) qLO(y, mu=10 ,sigma=2), 0, 1)
# library(gamlss)
# data(abdom)
# h<-gamlss(y~cs(x,df=3), sigma.formula=~cs(x,1), family=LO, data=abdom) # fits 
# plot(h)



