library(itsmr)


### Name: forecast
### Title: Forecast future values
### Aliases: forecast

### ** Examples

M = c("log","season",12,"trend",1)
e = Resid(wine,M)
a = arma(e,1,1)
forecast(wine,M,a)



