library(marima)


### Name: arma.forecast
### Title: arma.forecast
### Aliases: arma.forecast

### ** Examples


library(marima)
data(austr)
series<-austr
Model5 <- define.model(kvar=7, ar=1, ma=1, rem.var=1, reg.var=6:7)
Marima5 <- marima(ts(series[1:90, ]), Model5$ar.pattern, Model5$ma.pattern, 
penalty=1)

nstart  <- 90
nstep   <- 10
cat("Calling arma.forecast.\n")
cat("In the example the input series is dim(length,kvar).\n")
cat("and of type ts() (timeseries) for illustration. \n")
Forecasts <- arma.forecast(series=ts(series), marima=Marima5, 
               nstart=nstart, nstep=nstep )
Year<-series[91:100,1]
One.step <- Forecasts$forecasts[, (nstart+1)]
One.step
Predict  <- Forecasts$forecasts[ 2, 91:100]
Predict
stdv<-sqrt(Forecasts$pred.var[2, 2, ])
upper.lim=Predict+stdv*1.645
lower.lim=Predict-stdv*1.645
Out<-rbind(Year, Predict, upper.lim, lower.lim)
print(Out)
# plot results:
plot(series[1:100, 1], Forecasts$forecasts[2, ], type='l', xlab='Year', 
ylab='Rate of armed suicides', main='Prediction of suicides by firearms', 
ylim=c(0.0, 4.1))
lines(series[1:90, 1], series[1:90, 2], type='p')
grid(lty=2, lwd=1, col='black')
Years<-2005:2014
lines(Years, Predict, type='l')
lines(Years, upper.lim, type='l')
lines(Years, lower.lim, type='l')
lines(c(2004.5, 2004.5), c(0.0, 2.0), lty = 2)




