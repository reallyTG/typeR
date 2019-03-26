library(betategarch)


### Name: tegarch
### Title: Estimate first order Beta-Skew-t-EGARCH models
### Aliases: tegarch
### Keywords: Statistical Models

### ** Examples

##simulate series with 500 observations:
set.seed(123)
y <- tegarchSim(500, omega=0.01, phi1=0.9, kappa1=0.1, kappastar=0.05,
  df=10, skew=0.8)

##estimate a 1st. order Beta-t-EGARCH model and store the output in mymod:
mymod <- tegarch(y)

#print estimates and standard errors:
print(mymod)

#graph of fitted volatility (conditional standard deviation):
plot(fitted(mymod))

#graph of fitted volatility and more:
plot(fitted(mymod, verbose=TRUE))

#plot forecasts of volatility 1-step ahead up to 20-steps ahead:
plot(predict(mymod, n.ahead=20))

#full variance-covariance matrix:
vcov(mymod)



