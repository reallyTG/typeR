library(BTYD)


### Name: bgbb.PlotFrequencyInHoldout
### Title: BG/BB Plot Frequency in Holdout
### Aliases: bgbb.PlotFrequencyInHoldout

### ** Examples

data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
rf.matrix.holdout <- donationsSummary$rf.matrix.holdout
# donationsSummary$rf.matrix and donationsSummary$rf.matrix.holdout already
# have appropriate column names

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# number of periods in the calibration period
n.cal = max(rf.matrix[,"n.cal"])

bgbb.PlotFrequencyInHoldout (est.params, n.cal, rf.matrix.holdout)



