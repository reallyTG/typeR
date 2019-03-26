library(beautier)


### Name: check_mcmc
### Title: Check if the MCMC is a valid MCMC object.
### Aliases: check_mcmc

### ** Examples

 testthat::expect_silent(check_mcmc(create_mcmc()))

 # Must stop on non-MCMCs
 testthat::expect_error(check_mcmc(mcmc = "nonsense"))
 testthat::expect_error(check_mcmc(mcmc = NULL))
 testthat::expect_error(check_mcmc(mcmc = NA))



