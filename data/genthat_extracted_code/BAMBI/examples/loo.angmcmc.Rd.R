library(BAMBI)


### Name: loo.angmcmc
### Title: Leave-one-out cross-validation (LOO) for angmcmc objects
### Aliases: loo.angmcmc

### ** Examples

# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1, return_llik_contri = TRUE)
library(loo)
loo(fit.vmsin.20)



