library(BAMBI)


### Name: fit_incremental_angmix
### Title: Stepwise fitting of angular mixture models with incremental
###   component sizes and optimum model selection
### Aliases: fit_incremental_angmix

### ** Examples

# illustration only - more iterations needed for convergence
set.seed(1)
fit.vm.step.15 <- fit_incremental_angmix("vmsin", tim8, "BIC", start_ncomp = 1,
                                          max_ncomp = 3, n.iter = 15,
                                          n.chains = 1, save_fits=FALSE)
(fit.vm.best.15 <- bestmodel(fit.vm.step.15))
lattice::densityplot(fit.vm.best.15)




