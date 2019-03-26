library(AutoSEARCH)


### Name: sm
### Title: Estimate an AR-X Model with Log-ARCH-X Errors
### Aliases: sm
### Keywords: Statistical Models Time Series Financial Econometrics

### ** Examples

#Generate AR(1) model and independent normal regressors:
set.seed(123)
y <- arima.sim(list(ar=0.4), 200)
xregs <- matrix(rnorm(4*200), 200, 4)

#estimate AR(2) with intercept:
sm(y, mc=TRUE, ar=1:2)

#estimate AR(2) with intercept and four conditioning regressors
#in the mean:
sm(y, mc=TRUE, ar=1:2, mx=xregs)

#estimate a log-volatility specification with a log-ARCH(4)
#structure:
sm(y, arch=1:4)

#estimate a log-volatility specification with a log-ARCH(4)
#structure and an asymmetry or leverage term:
sm(y, arch=1:4, asym=1)

#estimate a log-volatility specification with a log-ARCH(4)
#structure, an asymmetry or leverage term, a 30-period log(EWMA) as
#volatility proxy, and the squareds of the conditioning regressors
#in the log-volatility specification:
sm(y, arch=1:4, asym=1, log.ewma=list(length=30), vx=log(xregs^2))

#estimate AR(2) with intercept and four conditioning regressors
#in the mean, and a log-volatility specification with a log-ARCH(4)
#structure, an asymmetry or leverage term, a 30-period log(EWMA) as
#volatility proxy, and the squareds of the conditioning regressors
#in the log-volatility specification:
sm(y, mc=TRUE, ar=1:2, mx=xregs, arch=1:4, asym=1,
  log.ewma=list(length=30), vx=log(xregs^2))



