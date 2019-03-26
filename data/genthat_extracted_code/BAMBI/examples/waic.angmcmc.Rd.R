library(BAMBI)


### Name: waic.angmcmc
### Title: Watanabe-Akaike Information Criterion (WAIC) for angmcmc objects
### Aliases: waic.angmcmc

### ** Examples

# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1, return_llik_contri = TRUE)
library(loo)
waic(fit.vmsin.20)




