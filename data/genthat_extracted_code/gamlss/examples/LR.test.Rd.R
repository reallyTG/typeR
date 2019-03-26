library(gamlss)


### Name: LR.test
### Title: Likelihood Ratio test for nested GAMLSS models
### Aliases: LR.test
### Keywords: regression

### ** Examples

data(usair)
m0<-gamlss(y~x1+x2, data=usair)
m1<-gamlss(y~x1+x2+x3+x4, data=usair)
LR.test(m0,m1)



