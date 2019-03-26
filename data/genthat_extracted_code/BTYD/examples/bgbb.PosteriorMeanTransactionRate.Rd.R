library(BTYD)


### Name: bgbb.PosteriorMeanTransactionRate
### Title: BG/BB Posterior Mean Transaction Rate
### Aliases: bgbb.PosteriorMeanTransactionRate
###   bgbb.rf.matrix.PosteriorMeanTransactionRate

### ** Examples

data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
# donationsSummary$rf.matrix already has appropriate column names

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# return the posterior mean transaction rate vector
bgbb.rf.matrix.PosteriorMeanTransactionRate(est.params, rf.matrix)



