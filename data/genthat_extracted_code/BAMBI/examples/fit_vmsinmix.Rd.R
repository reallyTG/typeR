library(BAMBI)


### Name: fit_vmsinmix
### Title: Fitting bivariate von Mises sine model mixtures using MCMC
### Aliases: fit_vmsinmix

### ** Examples

# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1)
fit.vmsin.20




