library(BTYD)


### Name: bgnbd.PlotFreqVsConditionalExpectedFrequency
### Title: BG/NBD Plot Frequency vs. Conditional Expected Frequency
### Aliases: bgnbd.PlotFreqVsConditionalExpectedFrequency

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# number of transactions by each customer in the 39 weeks
# following the calibration period
x.star <- cal.cbs[,"x.star"]

# parameters estimated using bgnbd.EstimateParameters
est.params <- c(0.243, 4.414, 0.793, 2.426)
# the maximum censor number that can be used
max(cal.cbs[,"x"])

# plot conditional expected holdout period frequencies,
# binned according to calibration period frequencies
bgnbd.PlotFreqVsConditionalExpectedFrequency(est.params, T.star=39, cal.cbs, x.star, censor=7)



