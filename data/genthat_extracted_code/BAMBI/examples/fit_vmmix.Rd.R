library(BAMBI)


### Name: fit_vmmix
### Title: Fitting univariate von Mises mixtures using MCMC
### Aliases: fit_vmmix

### ** Examples

# illustration only - more iterations needed for convergence
fit.vm.20 <- fit_vmmix(wind$angle, ncomp = 3, n.iter =  20,
                       n.chains = 1)
fit.vm.20



