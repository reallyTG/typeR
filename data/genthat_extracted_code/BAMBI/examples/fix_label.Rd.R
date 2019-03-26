library(BAMBI)


### Name: fix_label
### Title: Fix label switching in angmcmc objects
### Aliases: fix_label

### ** Examples

# first fit a vmsin mixture model
# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1)
# now apply fix_label
fit.vmsin.20.fix <- fix_label(fit.vmsin.20)




