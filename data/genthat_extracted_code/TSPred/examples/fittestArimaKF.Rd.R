library(TSPred)


### Name: fittestArimaKF
### Title: Automatic ARIMA fitting and prediction with Kalman filter
### Aliases: fittestArimaKF
### Keywords: ARIMA automatic fitting Kalman filter adjustment prediction
###   evaluation criterion errors

### ** Examples

## Not run: 
##D data(CATS,CATS.cont)
##D fArimaKF <- fittestArimaKF(CATS[,2],CATS.cont[,2])
##D #predicted values
##D pred <- fArimaKF$pred
##D 
##D #extracting Kalman filtered and smoothed time series from the best fitted model
##D fs <- KFAS::KFS(fArimaKF$model,filtering=c("state","mean"),smoothing=c("state","mean"))
##D f <- fitted(fs, filtered = TRUE) #Kalman filtered time  series
##D s <- fitted(fs) #Kalman smoothed time  series
##D #plotting the time series data
##D plot(c(CATS[,2],CATS.cont[,2]),type='o',lwd=2,xlim=c(960,1000),ylim=c(200,600),
##D  xlab="Time",ylab="ARIMAKF")
##D #plotting the Kalman filtered time series
##D lines(f,col='red',lty=2,lwd=2)
##D #plotting the Kalman smoothed time series
##D lines(s,col='green',lty=2,lwd=2)
##D #plotting predicted values
##D lines(ts(pred$mean,start=981),lwd=2,col='blue')
##D #plotting prediction intervals
##D lines(ts(pred$upper,start=981),lwd=2,col='light blue')
##D lines(ts(pred$lower,start=981),lwd=2,col='light blue')
## End(Not run)



