library(bmlm)


### Name: mlm
### Title: Estimate a multilevel mediation model
### Aliases: mlm

### ** Examples

## Not run: 
##D ## Run example from Bolger and Laurenceau (2013)
##D data(BLch9)
##D fit <- mlm(BLch9)
##D mlm_summary(fit)
##D 
##D ### With priors
##D Priors <- list(dy = 10, dm = 10, a = 2, b = 2, cp = 2,
##D                tau_dy = 1, tau_dm = 1, tau_a = 1, tau_b = 1, tau_cp = 1,
##D                lkj_shape = 2)
##D fit <- mlm(BLch9, priors = Priors)
## End(Not run)




