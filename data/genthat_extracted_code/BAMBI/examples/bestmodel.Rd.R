library(BAMBI)


### Name: bestmodel
### Title: Extracting angmcmc object corresponding to the best fitted model
###   in stepwise fits
### Aliases: bestmodel

### ** Examples

# illustration only - more iterations needed for convergence
set.seed(1)
fit.vmsin.step.15 <- fit_incremental_angmix("vmsin", tim8, start_ncomp = 1,
                                            max_ncomp = 3, n.iter = 15,
                                            n.chains = 1)
fit.vmsin.best.15 <- bestmodel(fit.vmsin.step.15)
fit.vmsin.best.15




