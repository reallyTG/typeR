library(astsa)


### Name: sarima
### Title: Fit ARIMA Models
### Aliases: sarima
### Keywords: ts

### ** Examples

sarima(log(AirPassengers),0,1,1,0,1,1,12)
(dog <- sarima(log(AirPassengers),0,1,1,0,1,1,12))
summary(dog$fit)  # fit has all the returned arima() values
plot(resid(dog$fit))  # plot the innovations (residuals) 
sarima(log(AirPassengers),0,1,1,0,1,1,12,details=FALSE)$BIC  # print model BIC only



