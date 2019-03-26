library(BAMBI)


### Name: AIC.angmcmc
### Title: AIC and BIC for angmcmc objects
### Aliases: AIC.angmcmc BIC.angmcmc

### ** Examples

# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1)
AIC(fit.vmsin.20)
BIC(fit.vmsin.20)




