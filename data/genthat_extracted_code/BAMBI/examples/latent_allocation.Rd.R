library(BAMBI)


### Name: latent_allocation
### Title: Finding latent allocation (component indicators) from an angmcmc
###   object
### Aliases: latent_allocation

### ** Examples

# first fit a vmsin mixture model
# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1)
# now find latent allocation
latent_allocation(fit.vmsin.20)



