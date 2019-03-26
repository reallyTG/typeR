library(gamlss)


### Name: getSmo
### Title: Extracting Smoother information from a GAMLSS fitted object
### Aliases: getSmo
### Keywords: regression

### ** Examples

data(usair)
t1<-gamlss(y~x1+pb(x5)+pb(x6), data=usair, family=GA)
# get the value for lambda for the second fitted term in mu
getSmo(t1, parameter="mu", 2)$lambda
  


