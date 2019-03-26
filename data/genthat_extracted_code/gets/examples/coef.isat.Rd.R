library(gets)


### Name: coef.isat
### Title: Extraction functions for 'isat' objects
### Aliases: coef.isat fitted.isat logLik.isat plot.isat predict.isat
###   print.isat residuals.isat sigma.isat summary.isat vcov.isat
### Keywords: Statistical Models Time Series Econometrics Financial
###   Econometrics

### ** Examples

##step indicator saturation:
set.seed(123)
y <- rnorm(30)
isatmod <- isat(y)

##print results:
print(isatmod)

##plot the fitted vs. actual values, and the residuals:
plot(isatmod)

##print the entries of object 'isatmod':
summary(isatmod)

##extract coefficients of the simplified (specific) model:
coef(isatmod)

##extract log-likelihood:
logLik(isatmod)

##extract variance-covariance matrix of simplified
##(specific) model:
vcov(isatmod)

##extract and plot the fitted values:
mfit <- fitted(isatmod)
plot(mfit)

##extract and plot (mean) residuals:
epshat <- residuals(isatmod)
plot(epshat)

##extract and plot standardised residuals:
zhat <- residuals(isatmod, std=TRUE)
plot(zhat)

##generate forecasts with the simplified
##(specific) model:
predict(isatmod)




