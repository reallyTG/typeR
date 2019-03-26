library(BTYD)


### Name: bgnbd.PlotFrequencyInCalibration
### Title: BG/NBD Plot Frequency in Calibration Period
### Aliases: bgnbd.PlotFrequencyInCalibration

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# parameters estimated using bgnbd.EstimateParameters
est.params <- c(0.243, 4.414, 0.793, 2.426)
# the maximum censor number that can be used
max(cal.cbs[,"x"])

bgnbd.PlotFrequencyInCalibration(est.params, cal.cbs, censor=7)



