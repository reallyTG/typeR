library(forecast)


### Name: plot.Arima
### Title: Plot characteristic roots from ARIMA model
### Aliases: plot.Arima plot.ar autoplot.Arima autoplot.ar
### Keywords: hplot

### ** Examples


library(ggplot2)

fit <- Arima(WWWusage, order=c(3,1,0))
plot(fit)
autoplot(fit)

fit <- Arima(woolyrnq,order=c(2,0,0),seasonal=c(2,1,1))
plot(fit)
autoplot(fit)

plot(ar.ols(gold[1:61]))
autoplot(ar.ols(gold[1:61]))




