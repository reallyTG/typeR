library(gets)


### Name: paths
### Title: Extraction functions for 'arx', 'gets' and 'isat' objects
### Aliases: paths rsquared terminals
### Keywords: Statistical Models Time Series Econometrics Financial
###   Econometrics

### ** Examples

##Simulate from an AR(1):
set.seed(123)
y <- arima.sim(list(ar=0.4), 50)

##Simulate four independent Gaussian regressors:
xregs <- matrix(rnorm(4*50), 50, 4)

##estimate an AR(2) with intercept and four conditioning
##regressors in the mean:
mymod <- arx(y, mc=TRUE, ar=1:2, mxreg=xregs)
rsquared(mymod)

##General-to-Specific (GETS) modelling of the mean:
meanmod <- getsm(mymod)
rsquared(meanmod)

##extract the paths searched:
paths(meanmod)

##extract the terminal models:
terminals(meanmod)



