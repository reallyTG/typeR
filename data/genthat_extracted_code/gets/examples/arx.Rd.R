library(gets)


### Name: arx
### Title: Estimate an AR-X model with log-ARCH-X errors
### Aliases: arx
### Keywords: Statistical Models Time Series Econometrics Financial
###   Econometrics

### ** Examples

##Simulate from an AR(1):
set.seed(123)
y <- arima.sim(list(ar=0.4), 70)

##estimate an AR(2) with intercept:
arx(y, mc=TRUE, ar=1:2)

##Simulate four independent Gaussian regressors:
xregs <- matrix(rnorm(4*70), 70, 4)

##estimate an AR(2) with intercept and four conditioning
##regressors in the mean:
arx(y, mc=TRUE, ar=1:2, mxreg=xregs)

##estimate a log-variance specification with a log-ARCH(4)
##structure:
arx(y, arch=1:4)

##estimate a log-variance specification with a log-ARCH(4)
##structure and an asymmetry/leverage term:
arx(y, arch=1:4, asym=1)

##estimate a log-variance specification with a log-ARCH(4)
##structure, an asymmetry or leverage term, a 10-period log(EWMA) as
##volatility proxy, and the log of the squareds of the conditioning
##regressors in the log-variance specification:
arx(y, arch=1:4, asym=1, log.ewma=list(length=10), vxreg=log(xregs^2))

##estimate an AR(2) with intercept and four conditioning regressors
##in the mean, and a log-variance specification with a log-ARCH(4)
##structure, an asymmetry or leverage term, a 10-period log(EWMA) as
##volatility proxy, and the log of the squareds of the conditioning
##regressors in the log-variance specification:
arx(y, mc=TRUE, ar=1:2, mxreg=xregs, arch=1:4, asym=1,
  log.ewma=list(length=10), vxreg=log(xregs^2))



