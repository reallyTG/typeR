library(AnalyzeTS)


### Name: forecastGARCH
### Title: Forecast GARCH Model
### Aliases: forecastGARCH

### ** Examples

#Load data
library(TTR)
data(ttrc)

#Calculate SSL series
t<-ts(ttrc[,"Close"],start=1,frequency=5)
ln.t<-log(t)
r<-diff(ln.t)

#Find a ARIMA model
fit1<-arima(r,order=c(4,0,0))

#Find a GARCH model
res1<-resid(fit1)
library(tseries)
fit2<-garch(res1,order=c(2,1),trace=0)

#Forecasting
forecastGARCH(fit1,fit2,r=6,trace=TRUE)
forecastGARCH(fit1,fit2,r=6)



