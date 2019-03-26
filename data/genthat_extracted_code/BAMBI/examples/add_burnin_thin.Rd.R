library(BAMBI)


### Name: add_burnin_thin
### Title: Add (extra) burnin and thin to angmcmc object after original run
### Aliases: add_burnin_thin

### ** Examples

# first fit a vmsin mixture model
# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1)
lpdtrace(fit.vmsin.20)
# Now add extra burn-in
fit.vmsin.20.burn <- add_burnin_thin(fit.vmsin.20, 0.3)
lpdtrace(fit.vmsin.20.burn)



