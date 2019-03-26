library(BAMBI)


### Name: is.angmcmc
### Title: Angular MCMC ('angmcmc') Object
### Aliases: is.angmcmc angmcmc

### ** Examples

# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1)
is.angmcmc(fit.vmsin.20)



