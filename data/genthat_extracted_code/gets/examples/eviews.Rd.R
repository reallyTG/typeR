library(gets)


### Name: eviews
### Title: Exporting results to EViews and STATA
### Aliases: eviews stata
### Keywords: Statistical Models Time Series Econometrics Financial
###   Econometrics

### ** Examples

##simulate random variates, estimate model:
y <- rnorm(30)
mX <- matrix(rnorm(30*2), 30, 2)
mymod <- arx(y, mc=TRUE, mxreg=mX)

##print EViews code:
eviews(mymod)

##print Stata code:
stata(mymod)



