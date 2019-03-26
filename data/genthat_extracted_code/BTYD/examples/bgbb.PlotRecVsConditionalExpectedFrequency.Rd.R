library(BTYD)


### Name: bgbb.PlotRecVsConditionalExpectedFrequency
### Title: BG/BB Plot Recency vs Conditional Expected Frequency
### Aliases: bgbb.PlotRecVsConditionalExpectedFrequency

### ** Examples

data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
# donationsSummary$rf.matrix already has appropriate column names

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# get the holdout period transactions
x.star <- donationsSummary$x.star

# number of transaction opportunities in the holdout period
n.star <- 5

# Compare holdout period transactions.
bgbb.PlotRecVsConditionalExpectedFrequency(est.params, n.star, rf.matrix, x.star, trunc=6)



