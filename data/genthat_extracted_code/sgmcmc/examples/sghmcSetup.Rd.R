library(sgmcmc)


### Name: sghmcSetup
### Title: Create an sghmc object
### Aliases: sghmcSetup

### ** Examples

## Not run: 
##D # Simulate from a Normal Distribution, unknown location and known scale with uninformative prior
##D # Run sgmcmc step by step and calculate estimate of location on the fly to reduce storage
##D dataset = list("x" = rnorm(1000))
##D params = list("theta" = 0)
##D logLik = function(params, dataset) {
##D     distn = tf$distributions$Normal(params$theta, 1)
##D     return(tf$reduce_sum(distn$log_prob(dataset$x)))
##D }
##D stepsize = list("theta" = 1e-4)
##D sghmc = sghmcSetup(logLik, dataset, params, stepsize)
##D nIters = 10^4L
##D # Initialize location estimate
##D locEstimate = 0
##D # Initialise TensorFlow session
##D sess = initSess(sghmc)
##D for ( i in 1:nIters ) {
##D     sgmcmcStep(sghmc, sess)
##D     locEstimate = locEstimate + 1 / nIters * getParams(sghmc, sess)$theta
##D }
##D # For more examples see vignettes
## End(Not run)



