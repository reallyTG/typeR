library(BTYD)


### Name: bgbb.PosteriorMeanDropoutRate
### Title: BG/BB Posterior Mean Dropout Rate
### Aliases: bgbb.PosteriorMeanDropoutRate
###   bgbb.rf.matrix.PosteriorMeanDropoutRate

### ** Examples

data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
# donationsSummary$rf.matrix already has appropriate column names

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# return the posterior mean dropout rate vector
bgbb.rf.matrix.PosteriorMeanDropoutRate(est.params, rf.matrix)



