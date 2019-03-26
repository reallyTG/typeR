library(beautier)


### Name: are_equal_mcmcs
### Title: Determine if two MCMCs are equal.
### Aliases: are_equal_mcmcs

### ** Examples

  mcmc_1 <- create_mcmc(chain_length = 1000)
  mcmc_2 <- create_mcmc(chain_length = 314)
  testthat::expect_true(are_equal_mcmcs(mcmc_1, mcmc_1))
  testthat::expect_false(are_equal_mcmcs(mcmc_1, mcmc_2))



