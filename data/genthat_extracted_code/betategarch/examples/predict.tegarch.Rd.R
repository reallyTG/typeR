library(betategarch)


### Name: predict.tegarch
### Title: Generate volatility forecasts _n_-steps ahead
### Aliases: predict.tegarch
### Keywords: Statistical Models

### ** Examples

##simulate series with 500 observations:
set.seed(123)
y <- tegarchSim(500, omega=0.01, phi1=0.9, kappa1=0.1, kappastar=0.05, df=10, skew=0.8)

##estimate a 1st. order Beta-t-EGARCH model and store the output in mymod:
mymod <- tegarch(y)

#plot forecasts of volatility 1-step ahead up to 10-steps ahead:
plot(predict(mymod, n.ahead=10))



