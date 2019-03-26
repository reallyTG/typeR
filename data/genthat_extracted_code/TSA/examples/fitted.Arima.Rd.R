library(TSA)


### Name: fitted.Arima
### Title: Fitted values of an arima model.
### Aliases: fitted.Arima
### Keywords: methods

### ** Examples

data(hare)
hare.m1=arima(sqrt(hare),order=c(3,0,0))
fitted(hare.m1)



