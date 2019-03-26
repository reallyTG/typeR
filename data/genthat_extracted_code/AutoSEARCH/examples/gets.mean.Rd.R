library(AutoSEARCH)


### Name: gets.mean
### Title: General-to-Specific (GETS) Modelling of an AR-X model with
###   log-ARCH-X errors
### Aliases: gets.mean gets.vol
### Keywords: Statistical Models Time Series Financial Econometrics

### ** Examples

#Generate AR(1) model and four independent normal regressors:
set.seed(123)
y <- arima.sim(list(ar=0.4), 200)
xregs <- matrix(rnorm(4*200), 200, 4)

#General-to-Specific model selection of the mean:
mymodel <- gets.mean(y, mc=TRUE, ar=1:5, mx=xregs)

#General-to-Specific model selection of the mean
#with the intercept excluded from removal:
mymodel <- gets.mean(y, mc=TRUE, ar=1:5, mx=xregs, keep=1)

#General-to-Specific model selection of the mean
#with no intercept and with a log-ARCH(4) specification
#in the log-volatility using the standardised residuals
#when computing the log-likelihood for the information
#criterion:
mymodel <- gets.mean(y, mc=FALSE, ar=1:5, mx=xregs, arch=1:4,
  info.resids="standardised")

#General-to-Specific model selection of the mean with
#non-default serial-correlation diagnostics settings:
mymodel <- gets.mean(y, mc=TRUE, ar=1:5, mx=xregs,
  ar.LjungB=c(6, 0.05))

#General-to-Specific model selection of the mean with
#very liberal (i.e. 20 percent) significance levels (20 percent):
mymodel <- gets.mean(y, mc=TRUE, ar=1:5, mx=xregs, t.pval=0.2,
  wald.pval=0.2)
  
#Generate iid normal residuals and a matrix of independent
#normals:
set.seed(123)
e <- rnorm(200)
xregs <- matrix(rnorm(4*200), 200, 4)

#General-to-Specific model selection of log-volatility:
mymodel <- gets.vol(e, arch=1:5, vx=log(xregs^2))

#General-to-Specific model selection of log-volatility
#with the log-ARCH(1) term excluded from removal:
mymodel <- gets.vol(e, arch=1:5, vx=log(xregs^2), keep=2)

#General-to-Specific model selection of log-volatility
#with all the log-ARCH terms excluded from removal:
mymodel <- gets.vol(e, arch=1:5, vx=log(xregs^2), asym=1:2,
  log.ewma=list(length=5), keep=2:6)

#If e is a daily (weekends excluded) financial return series,
#then the following specification includes a lagged volatility
#proxy both for the week (5-day average of squared return) and
#for the month (20-day average of squared returns), in addition
#to five log-ARCH terms:
mymodel <- gets.vol(e, arch=1:5, log.ewma=list(length=c(5,20)) )

#General-to-Specific model selection with very liberal
#(20 percent) significance levels:
mymodel <- gets.vol(e, arch=1:5, vx=log(xregs^2), t.pval=0.2,
  wald.pval=0.2)



