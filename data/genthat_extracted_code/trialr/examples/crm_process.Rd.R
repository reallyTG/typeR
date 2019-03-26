library(trialr)


### Name: crm_process
### Title: Process RStan samples from a CRM model
### Aliases: crm_process

### ** Examples

## Not run: 
##D dat <- list(
##D   num_doses = 5,
##D   skeleton = c(0.05, 0.12, 0.25, 0.40, 0.55),
##D   target = 0.25,
##D   beta_sd = sqrt(1.34),
##D   num_patients = 3,
##D   doses = c(1, 2, 3),
##D   tox = c(0, 0, 1)
##D )
##D samp <- rstan::sampling(stanmodels$CrmEmpiricNormalPrior,
##D                         data = dat, seed = 123)
##D decision <- crm_process(dat, samp)
## End(Not run)




