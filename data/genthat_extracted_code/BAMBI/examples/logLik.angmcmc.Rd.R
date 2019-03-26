library(BAMBI)


### Name: logLik.angmcmc
### Title: Extract Log-Likelihood from angmcmc objects
### Aliases: logLik.angmcmc

### ** Examples

# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1)
logLik(fit.vmsin.20)



