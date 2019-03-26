library(sparsenet)


### Name: cv.sparsenet
### Title: Cross-validation for sparsenet
### Aliases: cv.sparsenet
### Keywords: lasso subset

### ** Examples

train.data=gendata(100,1000,nonzero=30,rho=0.3,snr=3)
fit=sparsenet(train.data$x,train.data$y)
par(mfrow=c(3,3))
plot(fit)
par(mfrow=c(1,1))
fitcv=cv.sparsenet(train.data$x,train.data$y,trace.it=TRUE)
plot(fitcv)



