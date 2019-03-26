library(BAMBI)


### Name: summary.angmcmc
### Title: Summary statistics for parameters from an angmcmc object
### Aliases: summary.angmcmc

### ** Examples

# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1)
summary(fit.vmsin.20)




