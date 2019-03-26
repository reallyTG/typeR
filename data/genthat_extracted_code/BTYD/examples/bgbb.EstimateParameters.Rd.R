library(BTYD)


### Name: bgbb.EstimateParameters
### Title: BG/BB Parameter Estimation
### Aliases: bgbb.EstimateParameters

### ** Examples

data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
# donationsSummary$rf.matrix already has appropriate column names

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)
# log-likelihood of estimated parameters
bgbb.rf.matrix.LL(est.params, rf.matrix)



