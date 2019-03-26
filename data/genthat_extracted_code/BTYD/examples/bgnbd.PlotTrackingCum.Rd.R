library(BTYD)


### Name: bgnbd.PlotTrackingCum
### Title: BG/NBD Tracking Cumulative Transactions Plot
### Aliases: bgnbd.PlotTrackingCum

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# Cumulative repeat transactions made by all customers across calibration
# and holdout periods
cu.tracking <- cdnowSummary$cu.tracking

# parameters estimated using bgnbd.EstimateParameters
est.params <- c(0.243, 4.414, 0.793, 2.426)

# All parameters are in weeks; the calibration period lasted 39
# weeks and the holdout period another 39.
bgnbd.PlotTrackingCum(est.params, T.cal=cal.cbs[,"T.cal"], T.tot=78, cu.tracking)



