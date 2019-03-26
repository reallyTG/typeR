library(smooth)


### Name: auto.msarima
### Title: Automatic Multiple Seasonal ARIMA
### Aliases: auto.msarima
### Keywords: models nonlinear regression smooth ts univar

### ** Examples


x <- rnorm(118,100,3)

# The best ARIMA for the data
ourModel <- auto.msarima(x,orders=list(ar=c(2,1),i=c(1,1),ma=c(2,1)),lags=c(1,12),
                     h=18,holdout=TRUE,intervals="np")

# The other one using optimised states
## Not run: 
##D auto.msarima(x,orders=list(ar=c(3,2),i=c(2,1),ma=c(3,2)),lags=c(1,12),
##D                      initial="o",h=18,holdout=TRUE)
## End(Not run)

# And now combined ARIMA
## Not run: 
##D auto.msarima(x,orders=list(ar=c(3,2),i=c(2,1),ma=c(3,2)),lags=c(1,12),
##D                       combine=TRUE,h=18,holdout=TRUE)
## End(Not run)

summary(ourModel)
forecast(ourModel)
plot(forecast(ourModel))





