library(forecast)


### Name: dshw
### Title: Double-Seasonal Holt-Winters Forecasting
### Aliases: dshw
### Keywords: ts

### ** Examples


## Not run: 
##D fcast <- dshw(taylor)
##D plot(fcast)
##D 
##D t <- seq(0,5,by=1/20)
##D x <- exp(sin(2*pi*t) + cos(2*pi*t*4) + rnorm(length(t),0,.1))
##D fit <- dshw(x,20,5)
##D plot(fit)
## End(Not run)




