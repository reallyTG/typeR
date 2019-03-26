library(TSA)


### Name: arimax
### Title: Fitting an ARIMA model with Exogeneous Variables
### Aliases: arimax
### Keywords: methods

### ** Examples


data(airmiles)
plot(log(airmiles),ylab='Log(airmiles)',xlab='Year', main='')
acf(diff(diff(window(log(airmiles),end=c(2001,8)),12)),lag.max=48,main='')
air.m1=arimax(log(airmiles),order=c(0,1,1),seasonal=list(order=c(0,1,1),
period=12),xtransf=data.frame(I911=1*(seq(airmiles)==69),
I911=1*(seq(airmiles)==69)),
transfer=list(c(0,0),c(1,0)),xreg=data.frame(Dec96=1*(seq(airmiles)==12),
Jan97=1*(seq(airmiles)==13),Dec02=1*(seq(airmiles)==84)),method='ML')





