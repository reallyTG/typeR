library(TSPred)


### Name: fittestPolyR
### Title: Automatic fitting and prediction of polynomial regression
### Aliases: fittestPolyR
### Keywords: polynomial regression automatic fitting adjustment prediction
###   evaluation criterion errors

### ** Examples

data(CATS,CATS.cont)
fPolyR <- fittestPolyR(CATS[,3],CATS.cont[,3])
#predicted values
pred <- fPolyR$pred

#plotting the time series data
plot(c(CATS[,3],CATS.cont[,3]),type='o',lwd=2,xlim=c(960,1000),ylim=c(-100,300),
xlab="Time",ylab="PR")
#plotting predicted values
lines(ts(pred$mean,start=981),lwd=2,col='blue')
#plotting prediction intervals
lines(ts(pred$lower,start=981),lwd=2,col='light blue')
lines(ts(pred$upper,start=981),lwd=2,col='light blue')



