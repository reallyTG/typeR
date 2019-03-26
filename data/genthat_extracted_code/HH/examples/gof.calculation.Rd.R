library(HH)


### Name: gof.calculation
### Title: Calculate Box-Ljung Goodness of Fit for ARIMA models in S-Plus.
### Aliases: gof.calculation
### Keywords: ts

### ** Examples

if.R(s={
co2.arima <- arima.mle(co2, list(list(order=c(0,1,1)),
                                 list(order=c(0,1,1), period=12)))
co2.acf <- acf(resid(co2.arima), plot=FALSE, lag=40)
co2.gof <- gof.calculation(co2.acf, 36, length(co2), 2)
xyplot(p.value ~ lag, data=co2.gof, panel=panel.gof,
       ylim=range(0, co2.gof$p.value))
},r={})



