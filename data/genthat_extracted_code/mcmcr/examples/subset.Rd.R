library(mcmcr)


### Name: subset
### Title: Subset an MCMC Object
### Aliases: subset subset.term subset.mcmc subset.mcmc.list
###   subset.mcmcarray subset.mcmcr

### ** Examples

subset(mcmcr_example, chains = 2L, iterations = 1:100,
  parameters = c("beta", "alpha"))



