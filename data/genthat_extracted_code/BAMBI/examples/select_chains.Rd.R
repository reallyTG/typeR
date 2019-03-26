library(BAMBI)


### Name: select_chains
### Title: Select chains from angmcmc objects
### Aliases: select_chains

### ** Examples

# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             L = c(10, 12), chains_parallel = FALSE,
                             n.chains = 2)
fit.vmsin.20
fit.vmsin.20.1 <- select_chains(fit.vmsin.20, 1)
fit.vmsin.20.1




