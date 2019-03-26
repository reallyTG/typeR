library(gets)


### Name: printtex
### Title: Generate LaTeX code of an estimation result
### Aliases: printtex
### Keywords: Statistical Models Time Series Econometrics Financial
###   Econometrics

### ** Examples

##simulate random variates, estimate model:
y <- rnorm(30)
mX <- matrix(rnorm(30*2), 30, 2)
mymod <- arx(y, mc=TRUE, ar=1:3, mxreg=mX)

##print latex code of estimation result:
printtex(mymod)

##add intercept, at the end, to regressor matrix:
mX <- cbind(mX,1)
colnames(mX) <- c("xreg1", "xreg2", "intercept")
mymod <- arx(y, mxreg=mX)

##set intercept location to 3:
printtex(mymod, intercept=3)




