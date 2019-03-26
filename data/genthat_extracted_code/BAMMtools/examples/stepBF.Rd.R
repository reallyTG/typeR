library(BAMMtools)


### Name: stepBF
### Title: Identify the optimal number of shifts using Bayes factors
### Aliases: stepBF

### ** Examples

data(mcmc.whales)
# remove 10% burnin
mcmc.whales <- mcmc.whales[floor(0.1 * nrow(mcmc.whales)):nrow(mcmc.whales), ]
# from a square matrix of Bayes factor values (inputType = 'matrix')
bfmat <- computeBayesFactors(mcmc.whales, expectedNumberOfShifts = 1, burnin = 0)
stepBF(bfmat, step.size = 1, inputType = 'matrix')
# or from a vector of posterior probabilities (inputType = 'postProb')
postProb <- table(mcmc.whales$N_shifts) / nrow(mcmc.whales)
stepBF(postProb, step.size = 1, inputType = 'postProb')




