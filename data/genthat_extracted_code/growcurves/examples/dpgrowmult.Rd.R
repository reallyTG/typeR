library(growcurves)


### Name: dpgrowmult
### Title: Bayesian semiparametric growth curve models under employment of
###   more-than-'1' multiple membership random effects (block) term.
### Aliases: dpgrowmult
### Keywords: model

### ** Examples

## Not run: 
##D ## extract simulated dataset
##D library(growcurves)
##D data(datsimmult)
##D ## Model with DP on clients effects, but now INCLUDE session random effects
##D ## in a multiple membership construction communicated with the N x S matrix, W.subj.aff.
##D ## Returns object, res.mm, of class "dpgrowmm".
##D shape.dp	= 3
##D res.mult	= dpgrowmult(y = datsimmult$y, subject = datsimmult$subject, 
##D 		trt = datsimmult$trt, time = datsimmult$time, 
##D 		n.random = datsimmult$n.random, Omega = datsimmult$Omega, 
##D 		group = datsimmult$group, 
##D 		subj.aff = datsimmult$subj.aff, 
##D 		W.subj.aff = datsimmult$W.subj.aff, n.iter = 10000, 
##D 		n.burn = 2000, n.thin = 10, shape.dp = shape.dp, 
##D 		option = c("mmi","mmcar"))
##D plot.results	= plot(res.mult) ## ggplot2 plot objects, including growth curves
##D summary.results = summary(res.mult) ## parameter credible intervals, fit statistics
##D samples.posterior = samples(res.mult) ## posterior sampled values
## End(Not run)



