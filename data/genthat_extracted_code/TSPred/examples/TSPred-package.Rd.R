library(TSPred)


### Name: TSPred-package
### Title: Functions for Benchmarking Time Series Prediction
### Aliases: TSPred-package TSPred
### Keywords: package ARIMA time series prediction baseline benchmark
###   datasets competition fittest linear model polynomial regression
###   automatic fitting Kalman filter adjustment evaluation criterion
###   errors transform decomposition wavelet EMD

### ** Examples

#======== Fittest linear model ========
## Not run: 
##D data(CATS,CATS.cont)
##D fittest <- fittestLM(CATS[,1],CATS.cont[,1])
##D 
##D #fittest model information
##D fittest$rank[1,]
##D 
##D #predictions of the fittest model
##D fittest$ranked.results[[1]]$pred
## End(Not run)
#======== ===================== ========

#======== ARIMA fitting and prediction ========
#Example 1 - a single univariate time series
data(SantaFe.A,SantaFe.A.cont)
arimapred(SantaFe.A[,1],n.ahead=100)


#Example 2 - allowing the prediction of multiple univariate time series
marimapred(SantaFe.A,SantaFe.A.cont)

## Not run: 
##D #Example 3 - automatic fitting, prediction and accuracy evaluation
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
##D 
##D 
##D #Example 4 - automatic fitting with Kalman filter, prediction and accuracy evaluation
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
##D #======== ================ ========
##D 
##D #======== Polynomial regression fitting and prediction ========
##D #Example 1 - automatic fitting, prediction and accuracy evaluation
##D data(CATS,CATS.cont)
##D fPolyR <- fittestPolyR(CATS[,3],CATS.cont[,3])
##D #predicted values
##D pred <- fPolyR$pred
##D 
##D #plotting the time series data
##D plot(c(CATS[,3],CATS.cont[,3]),type='o',lwd=2,xlim=c(960,1000),ylim=c(-100,300),
##D xlab="Time",ylab="PR")
##D #plotting predicted values
##D lines(ts(pred$mean,start=981),lwd=2,col='blue')
##D #plotting prediction intervals
##D lines(ts(pred$lower,start=981),lwd=2,col='light blue')
##D lines(ts(pred$upper,start=981),lwd=2,col='light blue')
##D 
##D 
##D #Example 2 - automatic fitting with Kalman filter, prediction and accuracy evaluation
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
##D #======== ============================================ ========
##D 
##D #======== Automatic moving average smoothing and ARIMA prediction ========
##D fMAS <- fittestMAS(CATS[,1],h=20,model="arima")
##D 
##D #automatically selected order of moving average
##D mas.order <- fMAS$order
##D #======== ======================================================= ========
##D 
##D #======== Automatic wavelet transform and ARIMA prediction ========
##D fW <- fittestWavelet(CATS[,1],h=20,model="arima")
##D 
##D #plot wavelet transform/decomposition
##D plot(fW$WT)
##D #======== ================================================ ========
##D 
##D #======== Automatic empirical mode decomposition and VAR prediction ========
##D femd <- fittestEMD(CATS[,1],h=20)
##D #======== =========================================================== ========
## End(Not run)



