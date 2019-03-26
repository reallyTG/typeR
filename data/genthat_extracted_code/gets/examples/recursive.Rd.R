library(gets)


### Name: recursive
### Title: Recursive estimation
### Aliases: recursive
### Keywords: Statistical Models Time Series Econometrics Financial
###   Econometrics

### ** Examples

##generate random variates, estimate model:
y <- rnorm(100)
mX <- matrix(rnorm(4*100), 100, 4)
mymodel <- arx(y, mc=TRUE, mxreg=mX)

##compute recursive estimates and plot them:
recursive(mymodel)



