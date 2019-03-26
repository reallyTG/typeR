library(TSPred)


### Name: plotarimapred
### Title: Plot ARIMA predictions against actual values
### Aliases: plotarimapred
### Keywords: ARIMA prediction plot

### ** Examples

data(SantaFe.A,SantaFe.A.cont)
fit <- forecast::auto.arima(SantaFe.A)  
ts.cont <- ts(SantaFe.A.cont,start=1001)
plotarimapred(ts.cont, fit, xlim=c(1001,1100))



