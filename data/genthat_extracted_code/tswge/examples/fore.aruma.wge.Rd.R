library(tswge)


### Name: fore.aruma.wge
### Title: Function for forecasting from known model which may have
###   (1-B)^d, seasonal, and/or other nonstationary factors
### Aliases: fore.aruma.wge
### Keywords: Forecasts ARUMA ARIMA Seasonal

### ** Examples
data(airline)
          x=log(airline)
          phi12=c(-.36,-.05,-.14,-.11,.04,.09,-.02,.02,.17,.03,-.1,-.38)
          s=12
          d=1
          fore.aruma.wge(x,phi=phi12,d=1,s=12,n.ahead=12,limits=FALSE)


