library(rugarch)


### Name: ugarchfit-methods
### Title: function: Univariate GARCH Fitting
### Aliases: ugarchfit ugarchfit-methods ugarchfit,ANY-method
###   ugarchfit,uGARCHspec-method
### Keywords: methods

### ** Examples

# Basic GARCH(1,1) Spec
data(dmbp)
spec = ugarchspec()
fit = ugarchfit(data = dmbp[,1], spec = spec)
fit
coef(fit)
head(sigma(fit))
#plot(fit,which="all")
# in order to use fpm (forecast performance measure function)
# you need to select a subsample of the data:
spec = ugarchspec()
fit = ugarchfit(data = dmbp[,1], spec = spec, out.sample=100)
forc = ugarchforecast(fit, n.ahead=100)
# this means that 100 data points are left from the end with which to
# make inference on the forecasts
fpm(forc)



