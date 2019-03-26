library(BTYD)


### Name: pnbd.EstimateParameters
### Title: Pareto/NBD Parameter Estimation
### Aliases: pnbd.EstimateParameters

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# starting-point parameters
startingparams <- c(0.5, 6, 0.9, 8)
# estimated parameters
est.params <- pnbd.EstimateParameters(cal.cbs, startingparams)

# log-likelihood of estimated parameters
pnbd.cbs.LL(est.params, cal.cbs)

# compare the speed and results to the following:
cal.cbs.compressed <- pnbd.compress.cbs(cal.cbs)
est.params <- pnbd.EstimateParameters(cal.cbs.compressed, startingparams)



