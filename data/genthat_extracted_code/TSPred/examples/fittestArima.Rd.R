library(TSPred)


### Name: fittestArima
### Title: Automatic ARIMA fitting, prediction and accuracy evaluation
### Aliases: fittestArima
### Keywords: ARIMA automatic fitting adjustment prediction evaluation
###   criterion errors

### ** Examples

## Not run: 
##D data(CATS,CATS.cont)
##D fArima <- fittestArima(CATS[,1],CATS.cont[,1])
##D #predicted values
##D pred <- fArima$pred$mean
##D #model information
##D cbind(AICc=fArima$AICc, AIC=fArima$AIC, BIC=fArima$BIC,
##D  logLik=fArima$logLik, MSE=fArima$MSE, NMSE=fArima$NMSE, 
##D  MAPE=fArima$MSE, sMAPE=fArima$MSE, MaxError=fArima$MaxError)
##D 
##D #plotting the time series data
##D plot(c(CATS[,1],CATS.cont[,1]),type='o',lwd=2,xlim=c(960,1000),ylim=c(0,200),
##D  xlab="Time",ylab="ARIMA")
##D #plotting the predicted values
##D lines(ts(pred,start=981),lwd=2,col='blue')
##D #plotting prediction intervals
##D lines(ts(fArima$pred$upper[,2],start=981),lwd=2,col='light blue')
##D lines(ts(fArima$pred$lower[,2],start=981),lwd=2,col='light blue')
## End(Not run)



