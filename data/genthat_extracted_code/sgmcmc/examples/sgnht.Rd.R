library(sgmcmc)


### Name: sgnht
### Title: Stochastic Gradient Nose Hoover Thermostat
### Aliases: sgnht

### ** Examples

## Not run: 
##D # Simulate from a Normal Distribution with uninformative, improper prior
##D dataset = list("x" = rnorm(1000))
##D params = list("theta" = 0)
##D logLik = function(params, dataset) { 
##D     distn = tf$distributions$Normal(params$theta, 1)
##D     return(tf$reduce_sum(distn$log_prob(dataset$x)))
##D }
##D stepsize = list("theta" = 5e-6)
##D output = sgnht(logLik, dataset, params, stepsize)
##D # For more examples see vignettes
## End(Not run)



