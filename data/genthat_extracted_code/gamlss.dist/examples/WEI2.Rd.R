library(gamlss.dist)


### Name: WEI2
### Title: A specific parameterization of the Weibull distribution for
###   fitting a GAMLSS
### Aliases: WEI2 dWEI2 pWEI2 qWEI2 rWEI2
### Keywords: distribution regression

### ** Examples

WEI2()
dat<-rWEI(100, mu=.1, sigma=2)
hist(dat)
# library(gamlss)
# gamlss(dat~1, family=WEI2, method=CG())




