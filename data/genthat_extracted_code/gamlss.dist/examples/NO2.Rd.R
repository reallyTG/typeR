library(gamlss.dist)


### Name: NO2
### Title: Normal distribution (with variance as sigma parameter) for
###   fitting a GAMLSS
### Aliases: NO2 dNO2 pNO2 qNO2 rNO2
### Keywords: distribution regression

### ** Examples

NO()# gives information about the default links for the normal distribution
dat<-rNO(100)
hist(dat)        
plot(function(y) dNO(y, mu=10 ,sigma=2), 0, 20)
plot(function(y) pNO(y, mu=10 ,sigma=2), 0, 20)
plot(function(y) qNO(y, mu=10 ,sigma=2), 0, 1)
# library(gamlss)
# gamlss(dat~1,family=NO) # fits a constant for mu and sigma 



