library(rstan)


### Name: check_hmc_diagnostics
### Title: Check HMC diagnostics after sampling
### Aliases: check_hmc_diagnostics check_divergences check_treedepth
###   check_energy get_divergent_iterations get_max_treedepth_iterations
###   get_num_leapfrog_per_iteration get_num_divergent
###   get_num_max_treedepth get_bfmi get_low_bfmi_chains

### ** Examples

## Not run: 
##D schools <- stan_demo("eight_schools")
##D check_hmc_diagnostics(schools)
##D check_divergences(schools)
##D check_treedepth(schools)
##D check_energy(schools)
## End(Not run)



