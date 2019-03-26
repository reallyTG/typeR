library(metafolio)


### Name: plot_correlation_between_returns
### Title: Plot correlation of returns (i.e. metapopulation abundance)
###   across stocks.
### Aliases: plot_correlation_between_returns

### ** Examples

arma_env_params <- list(mean_value = 16, ar = 0.1, sigma_env = 2, ma = 0)
base1 <- meta_sim(n_pop = 10, env_params = arma_env_params, env_type =
  "arma", assess_freq = 5)
plot_correlation_between_returns(base1)



