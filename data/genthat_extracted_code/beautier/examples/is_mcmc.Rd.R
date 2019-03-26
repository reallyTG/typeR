library(beautier)


### Name: is_mcmc
### Title: Determine if the object is a valid MCMC
### Aliases: is_mcmc

### ** Examples

  testthat::expect_true(is_mcmc(create_mcmc()))
  testthat::expect_true(is_mcmc(create_nested_sampling_mcmc()))
  testthat::expect_false(is_mcmc("nonsense"))



