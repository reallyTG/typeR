library(gamlss.dist)


### Name: NOF
### Title: Normal distribution family for fitting a GAMLSS
### Aliases: NOF dNOF pNOF qNOF rNOF
### Keywords: distribution regression

### ** Examples

NOF()# gives information about the default links for the normal distribution family
# library(gamlss)
#data(abdom)        
## the normal distribution fit with constant sigma
#m1<-gamlss(y~poly(x,2), sigma.fo=~1, family=NO, data=abdom)
## the normal family fit with variance proportional to mu
#m2<-gamlss(y~poly(x,2), sigma.fo=~1, family=NOF, data=abdom, method=mixed(1,20))
## a nornal distribution fit with variance as a function of x
#m3 <-gamlss(y~poly(x,2), sigma.fo=~x,   family=NO, data=abdom, method=mixed(1,20)) 
#GAIC(m1,m2,m3)



