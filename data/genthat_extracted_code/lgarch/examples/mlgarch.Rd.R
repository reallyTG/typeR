library(lgarch)


### Name: mlgarch
### Title: Estimate a multivariate CCC-log-GARCH(1,1) model
### Aliases: mlgarch
### Keywords: Statistical Models Time Series Financial Econometrics

### ** Examples

##simulate 1000 observations from a 2-dimensional
##ccc-log-garch(1,1) w/default parameter values:
set.seed(123)
y <- mlgarchSim(1000)

##estimate a 2-dimensional ccc-log-garch(1,1):
mymod <- mlgarch(y)

##print results:
print(mymod)

##extract ccc-log-garch coefficients:
coef(mymod)

##extract Gaussian log-likelihood (zeros excluded) of the ccc-log-garch model:
logLik(mymod)

##extract Gaussian log-likelihood (zeros excluded) of the varma representation:
logLik(mymod, varma=TRUE)

##extract variance-covariance matrix:
vcov(mymod)

##extract and plot the fitted conditional standard deviations:
sdhat <- fitted(mymod)
plot(sdhat)

##extract and plot standardised residuals:
zhat <- residuals(mymod)
plot(zhat)



