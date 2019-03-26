library(BTYD)


### Name: bgnbd.PlotRecVsConditionalExpectedFrequency
### Title: BG/NBD Plot Actual vs. Conditional Expected Frequency by Recency
### Aliases: bgnbd.PlotRecVsConditionalExpectedFrequency

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# number of transactions by each customer in the 39 weeks following
# the calibration period
x.star <- cal.cbs[,"x.star"]

# parameters estimated using bgnbd.EstimateParameters
est.params <- c(0.243, 4.414, 0.793, 2.426)

# plot conditional expected holdout period transactions, binned according to
# calibration period recencies
bgnbd.PlotRecVsConditionalExpectedFrequency(est.params, cal.cbs, T.star=39, x.star)



