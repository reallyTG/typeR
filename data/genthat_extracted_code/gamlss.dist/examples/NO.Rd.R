library(gamlss.dist)


### Name: NO
### Title: Normal distribution for fitting a GAMLSS
### Aliases: NO dNO pNO qNO rNO
### Keywords: distribution regression

### ** Examples

NO()# gives information about the default links for the normal distribution
plot(function(y) dNO(y, mu=10 ,sigma=2), 0, 20)
plot(function(y) pNO(y, mu=10 ,sigma=2), 0, 20)
plot(function(y) qNO(y, mu=10 ,sigma=2), 0, 1)
dat<-rNO(100)
hist(dat)
# library(gamlss)        
# gamlss(dat~1,family=NO) # fits a constant for mu and sigma 



