library(metafolio)


### Name: monte_carlo_portfolios
### Title: Monte Carlo asset weights into portfolios
### Aliases: monte_carlo_portfolios

### ** Examples

weights_matrix <- create_asset_weights(n_pop = 4, n_sims = 3,
  weight_lower_limit = 0.001)
mc_ports <- monte_carlo_portfolios(weights_matrix = weights_matrix,
  n_sims = 3, mean_b = 1000)



