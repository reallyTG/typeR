library(astsa)


### Name: sarima.for
### Title: ARIMA Forecasting
### Aliases: sarima.for
### Keywords: ts

### ** Examples

sarima.for(log(AirPassengers),12,0,1,1,0,1,1,12) 
#  with regressors:
nummy   = length(soi)
n.ahead = 24 
nureg   = time(soi)[nummy] + seq(1,n.ahead)/12
sarima.for(soi,n.ahead,2,0,0,2,0,0,12, xreg=time(soi), newxreg=nureg) 



