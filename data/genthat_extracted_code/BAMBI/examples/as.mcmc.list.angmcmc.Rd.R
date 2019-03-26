library(BAMBI)


### Name: as.mcmc.list.angmcmc
### Title: Create an mcmc.list object from an angmcmc object
### Aliases: as.mcmc.list.angmcmc

### ** Examples

# first fit a vmsin mixture model
# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1)

# now convert it to mcmc.list
library(coda)
fit.vmsin.20.mcmc <- as.mcmc.list(fit.vmsin.20)



