library(McSpatial)


### Name: cparlwr
### Title: Conditionally Parametric LWR Estimation
### Aliases: cparlwr
### Keywords: Conditionally Parametric Nonparametric Locally Weighted
###   Regression

### ** Examples


data(cookdata)
par(ask=TRUE)
cookdata <- cookdata[cookdata$CHICAGO==1&!is.na(cookdata$LNFAR),]
fit1 <- cparlwr(LNFAR~DCBD,nonpar=~DCBD, window=.10, 
  data=cookdata)
fit2 <- cparlwr(LNFAR~DCBD,nonpar=~LONGITUDE+LATITUDE,window=.10,
  distance="LATLONG",data=cookdata)
cookdata$yhat1 <- fit1$yhat
cookdata$yhat2 <- fit2$yhat
o <- order(cookdata$DCBD)
plot(cookdata$DCBD[o], cookdata$LNFAR[o],main="Log Floor Area Ratio",
  xlab="Distance from CBD",ylab="Log FAR")
lines(cookdata$DCBD[o], cookdata$yhat1[o], col="red")
plot(cookdata$DCBD[o], cookdata$LNFAR[o],main="Log Floor Area Ratio",
  xlab="Distance from CBD",ylab="Log FAR")
points(cookdata$DCBD[o], cookdata$yhat2[o], col="red")




