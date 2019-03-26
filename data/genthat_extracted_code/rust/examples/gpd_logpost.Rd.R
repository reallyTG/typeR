library(rust)


### Name: gpd_logpost
### Title: Generalized Pareto posterior log-density
### Aliases: gpd_logpost

### ** Examples

## Not run: 
##D # Sample data from a GP(sigma, xi) distribution
##D gpd_data <- rgpd(m = 100, xi = 0, sigma = 1)
##D # Calculate summary statistics for use in the log-likelihood
##D ss <- gpd_sum_stats(gpd_data)
##D # Calculate the generalized Pareto log-posterior
##D gpd_logpost(pars = c(1, 0), ss = ss)
## End(Not run)



