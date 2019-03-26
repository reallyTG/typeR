library(breathtestcore)


### Name: coef.breathtestfit
### Title: S3 coef and summary for breathtestfit
### Aliases: coef.breathtestfit

### ** Examples

# Generate simulated data
data = cleanup_data(simulate_breathtest_data())
# Fit with the population method
fit = nlme_fit(data)
# All coefficients in the long form
coef(fit)
# Access coefficients directly
fit$coef
# Only t50 by Maes/Ghoos
# Can also be used with stan fit (slow!)
## Not run: 
##D if (require("breathteststan")) {
##D   fit = stan_fit(data, iter = 300, chain = 1)
##D   coef(fit)
##D   # We get quantiles here in key/value format
##D   unique(fit$coef$stat)
##D }
## End(Not run)



