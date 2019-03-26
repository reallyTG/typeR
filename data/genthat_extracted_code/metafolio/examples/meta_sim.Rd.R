library(metafolio)


### Name: meta_sim
### Title: Run a single metapopulation simulation.
### Aliases: meta_sim

### ** Examples

arma_env_params <- list(mean_value = 16, ar = 0.1, sigma_env = 2, ma = 0)
base1 <- meta_sim(n_pop = 10, env_params = arma_env_params,
  env_type = "arma", assess_freq = 5)

plot_sim_ts(base1, years_to_show = 70, burn = 30)



