library(BTYD)


### Name: bgbb.PlotFreqVsConditionalExpectedFrequency
### Title: BG/BB Plot Frequency vs Conditional Expected Frequency
### Aliases: bgbb.PlotFreqVsConditionalExpectedFrequency

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

# Plot holdout period transactions
bgbb.PlotFreqVsConditionalExpectedFrequency(est.params, n.star, rf.matrix, x.star, trunc=6)



