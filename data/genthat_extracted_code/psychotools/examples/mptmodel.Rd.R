library(psychotools)


### Name: mptmodel
### Title: Multinomial Processing Tree (MPT) Model Fitting Function
### Aliases: mptmodel coef.mptmodel confint.mptmodel deviance.mptmodel
###   estfun.mptmodel logLik.mptmodel predict.mptmodel print.mptmodel
###   summary.mptmodel print.summary.mptmodel vcov.mptmodel mptspec
###   print.mptspec update.mptspec
### Keywords: regression

### ** Examples

o <- options(digits = 4)

## data
data("SourceMonitoring", package = "psychotools")

## source-monitoring MPT model
mpt1 <- mptmodel(SourceMonitoring$y, spec = mptspec("SourceMon"))
summary(mpt1)
plot(mpt1)

options(digits = o$digits)



