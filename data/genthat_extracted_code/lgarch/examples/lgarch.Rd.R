library(lgarch)


### Name: lgarch
### Title: Estimate a log-GARCH model
### Aliases: lgarch
### Keywords: Statistical Models Time Series Financial Econometrics

### ** Examples

##simulate 500 observations w/default parameter values:
set.seed(123)
y <- lgarchSim(500)

##estimate a log-garch(1,1) w/least squares:
mymod <- lgarch(y)

##estimate the same model, but w/cex2 method:
mymod2 <- lgarch(y, method="cex2")

##print results:
print(mymod); print(mymod2)

##extract coefficients:
coef(mymod)

##extract Gaussian log-likelihood (zeros excluded) of the log-garch model:
logLik(mymod)

##extract Gaussian log-likelihood (zeros excluded) of the arma representation:
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



