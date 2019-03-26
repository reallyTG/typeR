library(BETS)


### Name: t_test
### Title: Test the significance of the parameters of an ARIMA model
### Aliases: t_test

### ** Examples

require(forecast)
data("AirPassengers")
fit.air<- Arima(AirPassengers,order = c(1,1,1), seasonal = c(1,1,1), method ="ML",lambda=0)
summary(fit.air)

# Significance test for the model SARIMA(1,1,1)(1,1,1)[12]
t_test(model = fit.air)





