library(BTYD)


### Name: bgbb.PlotFrequencyInCalibration
### Title: BG/BB Plot Frequency in Calibration Period
### Aliases: bgbb.PlotFrequencyInCalibration

### ** Examples

data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
# donationsSummary$rf.matrix already has appropriate column names

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# plot actual vs. expected frequencies in the calibration period
bgbb.PlotFrequencyInCalibration(est.params, rf.matrix)



