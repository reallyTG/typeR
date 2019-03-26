library(BTYD)


### Name: pnbd.PlotFreqVsConditionalExpectedFrequency
### Title: Pareto/NBD Plot Frequency vs. Conditional Expected Frequency
### Aliases: pnbd.PlotFreqVsConditionalExpectedFrequency

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# number of transactions by each customer in the 39 weeks
# following the calibration period
x.star <- cal.cbs[,"x.star"]

# parameters estimated using pnbd.EstimateParameters
est.params <- cdnowSummary$est.params
# the maximum censor number that can be used
max(cal.cbs[,"x"])

# plot conditional expected holdout period frequencies,
# binned according to calibration period frequencies
pnbd.PlotFreqVsConditionalExpectedFrequency(est.params, T.star=39, cal.cbs, x.star, censor=7)



