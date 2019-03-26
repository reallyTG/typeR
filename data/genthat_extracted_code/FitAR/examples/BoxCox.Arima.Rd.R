library(FitAR)


### Name: BoxCox.Arima
### Title: Box-Cox Analysis for "Arima" Objects
### Aliases: BoxCox.Arima
### Keywords: ts

### ** Examples

## Not run: 
##D  #not run to save time!
##D #Tobacco Production
##D  plot(USTobacco)
##D  USTobacco.arima<-arima(USTobacco,order=c(0,1,1))
##D  BoxCox(USTobacco.arima)
##D #
##D  air.arima<-arima(AirPassengers, c(0,1,1), seasonal=list(order=c(0,1,1), period=12))
##D  BoxCox(air.arima)
##D #
##D #In this example, we fit a model to the square-root of the sunspots and
##D #back transform in BoxCox.
##D sqrtsun.arima<-arima(sqrt(sunspot.year),c(2,0,0))
##D BoxCox(sqrtsun.arima, InitLambda=0.5, type="power")
##D #
##D #Back transform with AirPassengers
##D Garima<-arima(log(AirPassengers), c(0,1,1), seasonal=list(order=c(0,1,1),period=12))
##D BoxCox(Garima, InitLambda=0)
## End(Not run)



