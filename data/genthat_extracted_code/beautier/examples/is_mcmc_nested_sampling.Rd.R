library(beautier)


### Name: is_mcmc_nested_sampling
### Title: Determine if the object is a valid Nested-Sampling MCMC, as used
###   in [1]
### Aliases: is_mcmc_nested_sampling is_nested_sampling_mcmc

### ** Examples

  testthat::expect_false(is_nested_sampling_mcmc(create_mcmc()))
  testthat::expect_true(
    is_nested_sampling_mcmc(create_nested_sampling_mcmc())
  )
  testthat::expect_false(is_nested_sampling_mcmc("nonsense"))



