library(BAMBI)


### Name: fit_vmcosmix
### Title: Fitting bivariate von Mises cosine model mixtures using MCMC
### Aliases: fit_vmcosmix

### ** Examples

# illustration only - more iterations needed for convergence
fit.vmcos.10 <- fit_vmcosmix(tim8, ncomp = 3, n.iter =  10,
                             n.chains = 1)
fit.vmcos.10




