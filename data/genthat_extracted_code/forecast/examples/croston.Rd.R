library(forecast)


### Name: croston
### Title: Forecasts for intermittent demand using Croston's method
### Aliases: croston
### Keywords: ts

### ** Examples

y <- rpois(20,lambda=.3)
fcast <- croston(y)
plot(fcast)




