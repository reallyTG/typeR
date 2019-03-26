library(sgmcmc)


### Name: sgnhtcv
### Title: Stochastic Gradient Nose Hoover Thermostat with Control Variates
### Aliases: sgnhtcv

### ** Examples

## Not run: 
##D # Simulate from a Normal Distribution with uninformative prior
##D dataset = list("x" = rnorm(1000))
##D params = list("theta" = 0)
##D logLik = function(params, dataset) { 
##D     distn = tf$distributions$Normal(params$theta, 1)
##D     return(tf$reduce_sum(distn$log_prob(dataset$x)))
##D }
##D stepsize = list("theta" = 1e-4)
##D optStepsize = 1e-1
##D output = sgnhtcv(logLik, dataset, params, stepsize, optStepsize)
## End(Not run)



