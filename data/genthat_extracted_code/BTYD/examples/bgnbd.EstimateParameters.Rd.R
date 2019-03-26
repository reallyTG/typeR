library(BTYD)


### Name: bgnbd.EstimateParameters
### Title: BG/NBD Parameter Estimation
### Aliases: bgnbd.EstimateParameters

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# starting-point parameters
startingparams <- c(1.0, 3, 1.0, 3)
# estimated parameters
est.params <- bgnbd.EstimateParameters(cal.cbs, startingparams)

# log-likelihood of estimated parameters
bgnbd.cbs.LL(est.params, cal.cbs)



