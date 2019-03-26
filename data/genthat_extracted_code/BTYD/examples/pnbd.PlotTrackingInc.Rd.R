library(BTYD)


### Name: pnbd.PlotTrackingInc
### Title: Pareto/NBD Tracking Incremental Transactions Comparison
### Aliases: pnbd.PlotTrackingInc

### ** Examples

data(cdnowSummary)
cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# Cumulative repeat transactions made by all customers across calibration
# and holdout periods
cu.tracking <- cdnowSummary$cu.tracking
# make the tracking data incremental
inc.tracking <- dc.CumulativeToIncremental(cu.tracking)

# parameters estimated using pnbd.EstimateParameters
est.params <- cdnowSummary$est.params

# All parameters are in weeks; the calibration period lasted 39
# weeks and the holdout period another 39.
pnbd.PlotTrackingInc(est.params, T.cal=cal.cbs[,"T.cal"], T.tot=78, inc.tracking)



