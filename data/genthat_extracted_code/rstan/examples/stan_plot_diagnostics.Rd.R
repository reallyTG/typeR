library(rstan)


### Name: Diagnostic plots
### Title: RStan Diagnostic plots
### Aliases: stan_diag stan_par stan_rhat stan_ess stan_mcse

### ** Examples

## Not run: 
##D fit <- stan_demo("eight_schools")
##D 
##D stan_diag(fit, info = 'sample') # shows three plots together
##D samp_info <- stan_diag(fit, info = 'sample') # saves the three plots in a list
##D samp_info[[3]] # access just the third plot
##D 
##D stan_diag(fit, info = 'sample', chain = 1) # overlay chain 1
##D 
##D stan_par(fit, par = "mu")
## End(Not run)



