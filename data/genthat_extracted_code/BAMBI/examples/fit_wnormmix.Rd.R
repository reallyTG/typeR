library(BAMBI)


### Name: fit_wnormmix
### Title: Fitting univariate wrapped normal mixtures using MCMC
### Aliases: fit_wnormmix

### ** Examples

# illustration only - more iterations needed for convergence
fit.wnorm.20 <- fit_wnormmix(wind$angle, ncomp = 3, n.iter =  20,
                             n.chains = 1)
fit.wnorm.20




