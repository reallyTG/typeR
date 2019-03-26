library(tsdecomp)


### Name: compare.acf
### Title: Compare ACF of Theoretical, Estimator and Empirical Component
### Aliases: compare.acf plot.tsdecAcf
### Keywords: ts

### ** Examples

# Airlines model and monthly data
y <- log(AirPassengers)
fit <- arima(y, order=c(0,1,1), seasonal=list(order=c(0,1,1)))
dec <- ARIMAdec(y, fit, extend=72)
cacf <- compare.acf(x = dec, mod=fit, lag.max=24)
plot(cacf, component="seasonal")
# unexpected discrepancy between the ACF of the estimator and the 
# ACF of the empirical signal
plot(cacf, component="trend")

# Nile time series
y <- Nile
fit <- arima(y, order=c(0,1,1))
dec <- ARIMAdec(y, fit, extend=16)
cacf <- compare.acf(x = dec, mod=fit, lag.max=24)
plot(cacf, component="trend")



