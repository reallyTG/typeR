library(growcurves)


### Name: dpgrowmm
### Title: Bayesian semiparametric growth curve models with employment of
###   multiple membership random effects.
### Aliases: dpgrowmm
### Keywords: model

### ** Examples

## Not run: 
##D ## extract simulated dataset
##D library(growcurves)
##D data(datsim)
##D ## attach(datsim)
##D ## Model with DP on clients effects, but now INCLUDE session random effects
##D ## in a multiple membership construction communicated with the N x S matrix, W.subj.aff.
##D ## Returns object, res.mm, of class "dpgrowmm".
##D shape.dp	= 3
##D strength.mm	= 0.001
##D res.mm	= dpgrowmm(y = datsim$y, subject = datsim$subject, 
##D 		trt = datsim$trt, time = datsim$time, 
##D 		n.random = datsim$n.random, 
##D 		n.fix_degree = 2, Omega = datsim$Omega, 
##D 		group = datsim$group, 
##D 		subj.aff = datsim$subj.aff,
##D 		W.subj.aff = datsim$W.subj.aff, 
##D 		n.iter = 10000, n.burn = 2000, n.thin = 10,
##D 		shape.dp = shape.dp, rate.dp = rate.dp, 
##D 		strength.mm = strength.mm, option = "mmcar")
##D plot.results		= plot(res.mm) ## ggplot2 plot objects,
##D summary.results	= summary(res.mm) ## credible intervals and fit statistics
##D samples.posterior	= samples(res.mm) ## posterior sampled values
## End(Not run)



