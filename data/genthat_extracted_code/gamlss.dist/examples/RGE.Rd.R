library(gamlss.dist)


### Name: RGE
### Title: Reverse generalized extreme family distribution for fitting a
###   GAMLSS
### Aliases: RGE dRGE pRGE qRGE rRGE
### Keywords: distribution regression

### ** Examples

RGE()# default links for the reverse generalized extreme family distribution 
newdata<-rRGE(100,mu=0,sigma=1,nu=5) # generates 100 random observations
# library(gamlss)
# gamlss(newdata~1, family=RGE, method=mixed(5,50)) # difficult to converse 



