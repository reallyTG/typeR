library(gcdnet)


### Name: coef.gcdnet
### Title: get coefficients or make coefficient predictions from an
###   "gcdnet" object.
### Aliases: coef.gcdnet coef.hsvmpath coef.sqsvmpath coef.logitpath
###   coef.lspath coef.erpath
### Keywords: models regression

### ** Examples

data(FHT)
fit1=gcdnet(x=FHT$x,y=FHT$y)
coef(fit1,type="coef",s=c(0.1,0.005))
coef(fit1,type="nonzero")



