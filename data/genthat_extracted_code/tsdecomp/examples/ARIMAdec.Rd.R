library(tsdecomp)


### Name: ARIMAdec
### Title: ARIMA-Model-Based Decomposition of Time Series
### Aliases: ARIMAdec plot.ARIMAdec print.ARIMAdec
### Keywords: ts

### ** Examples

# Airlines model and monthly data
y <- log(AirPassengers)
fit <- arima(y, order=c(0,1,1), seasonal=list(order=c(0,1,1)))
dec <- ARIMAdec(y, fit, extend=72)
dec
plot(dec)

# JohnsonJohnson quarterly data
y <- log(JohnsonJohnson)
fit <- arima(y, order=c(0,1,1), seasonal=list(order=c(0,1,1)))
dec <- ARIMAdec(y, fit, extend=16)
dec
plot(dec)

# Nile annual data
# this series is better modelled as a level shift at 
# observation 29 and a mean (no ARMA structure),
# here the shift is ignored for illustration of the 
# decomposition of the fitted ARIMA(0,1,1) model
y <- Nile
fit <- arima(y, order=c(0,1,1))
dec <- ARIMAdec(y, fit, extend=72)
dec
plot(dec, overlap.trend=TRUE, args.trend=list(col="blue"))



