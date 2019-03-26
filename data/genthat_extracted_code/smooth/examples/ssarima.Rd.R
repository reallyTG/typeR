library(smooth)


### Name: ssarima
### Title: State Space ARIMA
### Aliases: ssarima
### Keywords: models nonlinear regression smooth ts univar

### ** Examples


# ARIMA(1,1,1) fitted to some data
ourModel <- ssarima(rnorm(118,100,3),orders=list(ar=c(1),i=c(1),ma=c(1)),lags=c(1),h=18,
                             holdout=TRUE,intervals="p")

# The previous one is equivalent to:
## Not run: 
##D ourModel <- ssarima(rnorm(118,100,3),ar.orders=c(1),i.orders=c(1),ma.orders=c(1),lags=c(1),h=18,
##D                     holdout=TRUE,intervals="p")
## End(Not run)

# Model with the same lags and orders, applied to a different data
ssarima(rnorm(118,100,3),orders=orders(ourModel),lags=lags(ourModel),h=18,holdout=TRUE)

# The same model applied to a different data
ssarima(rnorm(118,100,3),model=ourModel,h=18,holdout=TRUE)

# Example of SARIMA(2,0,0)(1,0,0)[4]
## Not run: ssarima(rnorm(118,100,3),orders=list(ar=c(2,1)),lags=c(1,4),h=18,holdout=TRUE)

# SARIMA(1,1,1)(0,0,1)[4] with different initialisations
## Not run: 
##D ssarima(rnorm(118,100,3),orders=list(ar=c(1),i=c(1),ma=c(1,1)),
##D         lags=c(1,4),h=18,holdout=TRUE)
##D ssarima(rnorm(118,100,3),orders=list(ar=c(1),i=c(1),ma=c(1,1)),
##D         lags=c(1,4),h=18,holdout=TRUE,initial="o")
## End(Not run)

# SARIMA of a peculiar order on AirPassengers data
## Not run: 
##D ssarima(AirPassengers,orders=list(ar=c(1,0,3),i=c(1,0,1),ma=c(0,1,2)),lags=c(1,6,12),
##D         h=10,holdout=TRUE)
## End(Not run)

# ARIMA(1,1,1) with Mean Squared Trace Forecast Error
## Not run: 
##D ssarima(rnorm(118,100,3),orders=list(ar=1,i=1,ma=1),lags=1,h=18,holdout=TRUE,cfType="TMSE")
##D ssarima(rnorm(118,100,3),orders=list(ar=1,i=1,ma=1),lags=1,h=18,holdout=TRUE,cfType="aTMSE")
## End(Not run)

# SARIMA(0,1,1) with exogenous variables
ssarima(rnorm(118,100,3),orders=list(i=1,ma=1),h=18,holdout=TRUE,xreg=c(1:118))

# SARIMA(0,1,1) with exogenous variables with crazy estimation of xreg
## Not run: 
##D ourModel <- ssarima(rnorm(118,100,3),orders=list(i=1,ma=1),h=18,holdout=TRUE,
##D                     xreg=c(1:118),updateX=TRUE)
## End(Not run)

summary(ourModel)
forecast(ourModel)
plot(forecast(ourModel))




