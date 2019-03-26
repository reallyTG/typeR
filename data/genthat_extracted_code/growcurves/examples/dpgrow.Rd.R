library(growcurves)


### Name: dpgrow
### Title: Bayesian semiparametric growth curve models.
### Aliases: dpgrow
### Keywords: model

### ** Examples

## Not run: 
##D ## extract simulated dataset
##D library(growcurves)
##D data(datsim)
##D ## attach(datsim)
##D ## run dpgrow mixed effects model; returns object of class "dpgrow"
##D shape.dp	= 4
##D res		= dpgrow(y = datsim$y, subject = datsim$subject, 
##D 		trt = datsim$trt, time = datsim$time,
##D 		n.random = datsim$n.random, 
##D 		n.fix_degree = 2, n.iter = 10000, 
##D 		n.burn = 2000, n.thin = 10,
##D 		shape.dp = shape.dp, option = "dp")
##D plot.results	= plot(res) ## ggplot2 plot objects, including growth curves
##D summary.results = summary(res) ## parameter credible intervals,  fit statistics
##D samples.posterior = samples(res) ## posterior sampled values
## End(Not run)



