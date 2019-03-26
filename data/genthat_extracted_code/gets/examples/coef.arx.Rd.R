library(gets)


### Name: coef.arx
### Title: Extraction functions for 'arx' objects
### Aliases: coef.arx fitted.arx logLik.arx plot.arx predict.arx print.arx
###   residuals.arx sigma.arx summary.arx vcov.arx
### Keywords: Statistical Models Time Series Econometrics Financial
###   Econometrics

### ** Examples

##simulate from an AR(1):
set.seed(123)
y <- arima.sim(list(ar=0.4), 40)

##simulate four independent Gaussian regressors:
xregs <- matrix(rnorm(4*40), 40, 4)

##estimate an AR(2) with intercept and four conditioning
##regressors in the mean, and log-ARCH(3) in the variance:
mymod <- arx(y, mc=TRUE, ar=1:2, mxreg=xregs, arch=1:3)

##print results:
print(mymod)

##plot the fitted vs. actual values, and the residuals:
plot(mymod)

##generate out-of-sample forecasts of the mean:
predict(mymod, newmxreg=matrix(0,12,4))

##print the entries of object 'mymod':
summary(mymod)

##extract coefficient estimates (automatically determined):
coef(mymod)

##extract mean coefficients only:
coef(mymod, spec="mean")

##extract log-variance coefficients only:
coef(mymod, spec="variance")

##extract all coefficient estimates:
coef(mymod, spec="both")

##extract regression standard error:
sigma(mymod)

##extract log-likelihood:
logLik(mymod)

##extract variance-covariance matrix of mean equation:
vcov(mymod)

##extract variance-covariance matrix of log-variance equation:
vcov(mymod, spec="variance")

##extract and plot the fitted mean values (automatically determined):
mfit <- fitted(mymod)
plot(mfit)

##extract and plot the fitted variance values:
vfit <- fitted(mymod, spec="variance")
plot(vfit)

##extract and plot both the fitted mean and variance values:
vfit <- fitted(mymod, spec="both")
plot(vfit)

##extract and plot the fitted mean values:
vfit <- fitted(mymod, spec="mean")
plot(vfit)

##extract and plot residuals:
epshat <- residuals(mymod)
plot(epshat)

##extract and plot standardised residuals:
zhat <- residuals(mymod, std=TRUE)
plot(zhat)




