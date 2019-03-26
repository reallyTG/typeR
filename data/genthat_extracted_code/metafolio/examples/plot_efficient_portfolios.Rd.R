library(metafolio)


### Name: plot_efficient_portfolios
### Title: Basic plot of efficient portfolio and asset contributions
### Aliases: plot_efficient_portfolios

### ** Examples

## Not run: 
##D weights_matrix <- create_asset_weights(n_pop = 6, n_sims = 3000,
##D weight_lower_limit = 0.001)
##D mc_ports <- monte_carlo_portfolios(weights_matrix = weights_matrix,
##D  n_sims = 3000, mean_b = 1000)
##D 
##D col_pal <- rev(gg_color_hue(6))
##D ef_dat <- plot_efficient_portfolios(port_vals = mc_ports$port_vals,
##D  pal = col_pal, weights_matrix = weights_matrix)
##D names(ef_dat)
## End(Not run)



