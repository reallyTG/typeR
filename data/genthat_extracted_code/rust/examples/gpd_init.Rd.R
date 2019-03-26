library(rust)


### Name: gpd_init
### Title: Initial estimates for Generalized Pareto parameters
### Aliases: gpd_init

### ** Examples

## Not run: 
##D # Sample data from a GP(sigma, xi) distribution
##D gpd_data <- rgpd(m = 100, xi = 0, sigma = 1)
##D # Calculate summary statistics for use in the log-likelihood
##D ss <- gpd_sum_stats(gpd_data)
##D # Calculate initial estimates
##D do.call(gpd_init, ss)
## End(Not run)



