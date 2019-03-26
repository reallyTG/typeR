library(BTYD)


### Name: pnbd.PlotRecVsConditionalExpectedFrequency
### Title: Pareto/NBD Plot Actual vs. Conditional Expected Frequency by
###   Recency
### Aliases: pnbd.PlotRecVsConditionalExpectedFrequency

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# number of transactions by each customer in the 39 weeks following
# the calibration period
x.star <- cal.cbs[,"x.star"]

# parameters estimated using pnbd.EstimateParameters
est.params <- cdnowSummary$est.params

# plot conditional expected holdout period transactions, binned according to
# calibration period recencies
pnbd.PlotRecVsConditionalExpectedFrequency(est.params, cal.cbs, T.star=39, x.star)



