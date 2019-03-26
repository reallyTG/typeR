library(gets)


### Name: iim
### Title: Make Indicator Matrices (Impulses, Steps, Trends)
### Aliases: iim sim tim
### Keywords: Statistical Models Time Series Econometrics Financial
###   Econometrics

### ** Examples

##generate series:
y <- rnorm(40)

##make matrix of impulse indicators:
mIIM <- iim(40)

##make matrix of step-indicators, but only every third:
mSIM <- sim(y, which.ones=seq(1,40,3))

##give quarterly time-series attributes to y-series:
y <- zooreg(y, frequency=4, end=c(2015,4))

##make matrix of trend-indicators with quarterly labels:
mTIM <- tim(y)




