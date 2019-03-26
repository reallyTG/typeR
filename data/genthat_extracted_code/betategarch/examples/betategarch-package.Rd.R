library(betategarch)


### Name: betategarch-package
### Title: Simulation, estimation and forecasting of Beta-Skew-t-EGARCH
###   models
### Aliases: betategarch-package betategarch

### ** Examples

#simulate 500 observations from model with default parameter values:
set.seed(123)
y <- tegarchSim(500)

#estimate and store as 'mymod':
mymod <- tegarch(y)

#print estimates and standard errors:
print(mymod)

#graph of fitted volatility (conditional standard deviation):
plot(fitted(mymod))

#plot forecasts of volatility 1-step ahead up to 10-steps ahead:
plot(predict(mymod, n.ahead=10))




