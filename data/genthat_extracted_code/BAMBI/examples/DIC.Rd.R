library(BAMBI)


### Name: DIC
### Title: Deviance Information Criterion (DIC) for angmcmc objects
### Aliases: DIC

### ** Examples

# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1)
DIC(fit.vmsin.20)




