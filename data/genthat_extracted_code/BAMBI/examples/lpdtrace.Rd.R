library(BAMBI)


### Name: lpdtrace
### Title: Trace and autocorrelation plots of log posterior density or log
###   likelihood from an angmcmc object
### Aliases: lpdtrace

### ** Examples

# first fit a vmsin mixture model
# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1)
# log posterior density trace
lpdtrace(fit.vmsin.20)
# log likelihood trace
lpdtrace(fit.vmsin.20, use.llik = TRUE)




