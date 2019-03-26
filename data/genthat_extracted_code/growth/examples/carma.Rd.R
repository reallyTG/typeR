library(growth)


### Name: carma
### Title: Continuous ARMA for Unequally Spaced Repeated Measurements
### Aliases: carma fitted.carma mprofile.carma residuals.carma coef.carma
###   deviance.carma print.carma
### Keywords: models

### ** Examples


y <- matrix(rnorm(40),ncol=5)
x1 <- gl(2,4)
x2 <- gl(2,1,8)
# independence with time trend
carma(y, ccov=~x1, torder=2)
# AR(1)
carma(y, ccov=~x1, torder=2, arma=c(1,0,0), parma=-0.5)
carma(y, ccov=~x1, torder=3, interact=3, arma=c(1,0,0), parma=-1)
# ARMA(2,1)
carma(y, ccov=~x1+x2, interact=c(2,0), torder=3,arma=c(2,1,0),
	parma=c(0.3,2,0.7))
# random intercept
carma(y, ccov=~x1+x2, interact=c(2,0), torder=3, pre=-0.4, 
	position=c(1,1))
# random coefficients
carma(y, ccov=~x1+x2, interact=c(2,0), torder=3, pre=c(-0.4,0.1), 
	position=rbind(c(1,1),c(2,2)))




