library(gamlss)


### Name: deviance.gamlss
### Title: Global Deviance of a GAMLSS model
### Aliases: deviance.gamlss
### Keywords: regression

### ** Examples

data(aids)
h<-gamlss(y~poly(x,3)+qrt, family=PO, data=aids) # 
deviance(h)
rm(h)



