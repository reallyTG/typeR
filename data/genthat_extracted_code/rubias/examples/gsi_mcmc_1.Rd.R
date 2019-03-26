library(rubias)


### Name: gsi_mcmc_1
### Title: MCMC from the simplest GSI model for pi and the individual
###   posterior probabilities
### Aliases: gsi_mcmc_1
### Keywords: internal

### ** Examples

# this demonstrates it with scaled likelihoods computed from
# assignment of the reference samples
params <- tcf2param_list(alewife, 17)
logl <- geno_logL(params)
SL <- apply(exp(logl), 2, function(x) x/sum(x))
lambda <- rep(1/params$C, params$C)
mcmc <- gsi_mcmc_1(SL, lambda, lambda, 200, 50, 5, 5)



