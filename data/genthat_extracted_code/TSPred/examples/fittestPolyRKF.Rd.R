library(TSPred)


### Name: fittestPolyRKF
### Title: Automatic fitting and prediction of polynomial regression with
###   Kalman filter
### Aliases: fittestPolyRKF
### Keywords: polynomial regression automatic fitting Kalman filter
###   adjustment prediction evaluation criterion errors

### ** Examples

## Not run: 
##D data(CATS,CATS.cont)
##D fPolyRKF <- fittestPolyRKF(CATS[,1],CATS.cont[,1])
##D #predicted values
##D pred <- fPolyRKF$pred
##D 
##D #extracting Kalman filtered and smoothed time series from the best fitted model
##D fs <- KFAS::KFS(fPolyRKF$model,filtering=c("state","mean"),smoothing=c("state","mean"))
##D f <- fitted(fs, filtered = TRUE) #Kalman filtered time  series
##D s <- fitted(fs) #Kalman smoothed time  series
##D #plotting the time series data
##D plot(c(CATS[,1],CATS.cont[,1]),type='o',lwd=2,xlim=c(960,1000),ylim=c(0,200),
##D  xlab="Time",ylab="PRKF")
##D #plotting the Kalman filtered time series
##D lines(f,col='red',lty=2,lwd=2)
##D #plotting the Kalman smoothed time series
##D lines(s,col='green',lty=2,lwd=2)
##D #plotting predicted values
##D lines(ts(pred$mean,start=981),lwd=2,col='blue')
##D #plotting prediction intervals
##D lines(ts(pred$lower,start=981),lwd=2,col='light blue')
##D lines(ts(pred$upper,start=981),lwd=2,col='light blue')
## End(Not run)



