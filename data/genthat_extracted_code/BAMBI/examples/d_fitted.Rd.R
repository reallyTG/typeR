library(BAMBI)


### Name: d_fitted
### Title: Density and random deviates from an angmcmc object
### Aliases: d_fitted r_fitted

### ** Examples

set.seed(1)
# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1)
d_fitted(c(0,0), fit.vmsin.20)
r_fitted(10, fit.vmsin.20)



