library(BAMBI)


### Name: pointest
### Title: Point estimates for parameters from an angmcmc object
### Aliases: pointest

### ** Examples

# first fit a vmsin mixture model
# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1)
# estimate parameters by sample mean
(est_mean <- pointest(fit.vmsin.20))
# estimate parameters by sample median
(est_median <- pointest(fit.vmsin.20, fn = median))
# estimate parameters by MAP
(est_median <- pointest(fit.vmsin.20, fn = "MODE"))



