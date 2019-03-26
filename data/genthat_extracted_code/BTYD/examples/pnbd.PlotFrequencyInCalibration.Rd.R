library(BTYD)


### Name: pnbd.PlotFrequencyInCalibration
### Title: Pareto/NBD Plot Frequency in Calibration Period
### Aliases: pnbd.PlotFrequencyInCalibration

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# parameters estimated using pnbd.EstimateParameters
est.params <- cdnowSummary$est.params
# the maximum censor number that can be used
max(cal.cbs[,"x"])

pnbd.PlotFrequencyInCalibration(est.params, cal.cbs, censor=7)



