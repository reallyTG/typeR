library(scoringRules)


### Name: GDP data
### Title: Data and forecasts for US GDP growth
### Aliases: gdp gdp_mcmc
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D # Load data
##D data(gdp_mcmc)
##D 
##D # Histogram of forecast draws for 2012Q4
##D fc_draws <- gdp_mcmc$forecasts[, "X2012Q4"]
##D hist(fc_draws, main = "Forecast draws for 2012:Q4", xlab = "Value")
##D 
##D # Add vertical line at realizing value
##D rlz <- gdp_mcmc$actuals[, "X2012Q4"]
##D abline(v = rlz, lwd = 3)
##D 
##D # Compute CRPS for this forecast case
##D crps_sample(y = rlz, dat = fc_draws)
##D 
## End(Not run)



