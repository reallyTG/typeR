library(BTYD)


### Name: bgbb.HeatmapHoldoutExpectedTrans
### Title: BG/BB Heatmap of Holdout Period Expected Transactions
### Aliases: bgbb.HeatmapHoldoutExpectedTrans

### ** Examples

data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
# donationsSummary$rf.matrix already has appropriate column names

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# Plot a heatmap of conditional expected transactions in
# a holdout period of 5 transaction opportunities, given
# that the calibration period consisted of 6 transaction
# opportunities.
bgbb.HeatmapHoldoutExpectedTrans(est.params, n.cal=6, n.star=5)



