library(lgarch)


### Name: lgarch-package
### Title: Simulation and estimation of log-GARCH models
### Aliases: lgarch-package

### ** Examples

##simulate 500 observations w/default parameter values from
##a univariate log-garch(1,1):
set.seed(123)
y <- lgarchSim(500)

##estimate a log-garch(1,1):
mymod <- lgarch(y)

##print results:
print(mymod)

##extract coefficients:
coef(mymod)

##extract Gaussian log-likelihood (zeros excluded, if any) of the log-garch model:
logLik(mymod)

##extract Gaussian log-likelihood (zeros excluded, if any) of the arma representation:
logLik(mymod, arma=TRUE)

##extract variance-covariance matrix:
vcov(mymod)

##extract and plot the fitted conditional standard deviation:
sdhat <- fitted(mymod)
plot(sdhat)

##extract and plot standardised residuals:
zhat <- residuals(mymod)
plot(zhat)

##extract and plot all the fitted series:
myhat <- fitted(mymod, verbose=TRUE)
plot(myhat)

##simulate 1000 observations from a two-dimensional
##ccc-log-garch(1,1) w/default parameter values:
set.seed(123)
yy <- mlgarchSim(1000)

##estimate a 2-dimensional ccc-log-garch(1,1):
myymod <- mlgarch(yy)

##print results:
print(myymod)




