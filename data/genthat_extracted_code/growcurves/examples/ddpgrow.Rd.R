library(growcurves)


### Name: ddpgrow
### Title: Bayesian semiparametric growth curve models.
### Aliases: ddpgrow
### Keywords: model

### ** Examples

## Not run: 
##D ## extract simulated dataset
##D library(growcurves)
##D data(datddpsim)
##D ## attach(datddpsim)
##D ## run dpgrow mixed effects model; returns object of class "ddpgrow"
##D shape.dp	= 4
##D res		= ddpgrow(y = dat$y, subject = dat$subject, 
##D 		trt = dat$trt, time = dat$time,
##D 		typetreat = c("mvn","car","ind","car"), 
##D 		numdose = dat$numdose, 
##D 		labt = dat$labt, dosemat = dat$dosemat, 
##D 		Omega = dat$Omega, n.random = dat$n.random, 
##D 		n.fix_degree = 2, n.iter = 10000, n.burn = 2000, 
##D 		n.thin = 10, shape.dp = 1)
##D plot.results	= plot(res) ## ggplot2 plot objects, including growth curves
##D summary.results = summary(res) ## parameter credible intervals,  fit statistics
##D samples.posterior = samples(res) ## posterior sampled values
## End(Not run)



