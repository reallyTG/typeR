library(gets)


### Name: diagnostics
### Title: Diagnostics tests
### Aliases: diagnostics
### Keywords: Statistical Models Time Series Econometrics Financial
###   Econometrics

### ** Examples

##return a data-frame with autocorrelation and ARCH diagnostics (default),
##and check whether they pass (the default p-value is 0.025):
set.seed(123)
vY <- rnorm(20)
mX <- matrix(rnorm(3*20), 20, 3)
est <- ols(vY,mX)
diagnostics(est)
diagnostics(est, verbose=FALSE)

##add the Jarque-Bera normality test to the diagnostics (w/p-value=0.05):
diagnostics(est, normality.JarqueB=0.05)
diagnostics(est, normality.JarqueB=0.05, verbose=FALSE)

##user-defined Shapiro-Wilks test for non-normality of the residuals:
SWtest <- function(residuals, ...){
  tmp <- shapiro.test(residuals) #do test on est$residuals
  return( c(tmp$statistic, NA, tmp$p.value) )
}
diagnostics(est, user.fun=list(name="SWtest", pval=0.05))
diagnostics(est, user.fun=list(name="SWtest", pval=0.05), verbose=FALSE)




