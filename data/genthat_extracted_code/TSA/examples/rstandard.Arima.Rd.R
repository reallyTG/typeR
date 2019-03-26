library(TSA)


### Name: rstandard.Arima
### Title: Compute the Standardized Residuals from a Fitted ARIMA Model
### Aliases: rstandard.Arima
### Keywords: methods

### ** Examples

data(oil.price)
m1.oil=arima(log(oil.price),order=c(0,1,1))
plot(rstandard(m1.oil),ylab='Standardized residuals',type='l')
abline(h=0)



