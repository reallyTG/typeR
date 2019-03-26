library(growcurves)


### Name: growcurves-package
### Title: Bayesian Semi and Nonparametric Growth Curve Models with
###   Employment of Multiple Membership Random Effects for Longitudinal
###   Data
### Aliases: growcurves growcurves-package package-growcurves
### Keywords: package

### ** Examples

## Not run: 
##D ## extract simulated dataset
##D library(growcurves)
##D data(datsim)
##D ## attach(datsim)
##D ## run dpgrow mixed effects model, returning object of class "dpgrow"
##D shape.dp	= 4
##D res		= dpgrow(y = datsim$y, subject = datsim$subject, 
##D 			trt = datsim$trt, time = datsim$time,
##D 			n.random = 3, n.fix_degree = 2, 
##D 			n.iter = 10000, n.burn = 2000, 
##D 			n.thin = 10, shape.dp = shape.dp, 
##D 			option = "dp")
##D ## Each plot is a "ggplot2" object saved in 
##D ## a list to plot.results
##D plot.results	= plot(res) ## includes subject and 
##D ##                    treatment growth curves
##D ## Extract credible intervals (2.5%, mean, 97.5%).
##D ## Includes fit statistics:  Dbar, DIC, pD, lpml.  
##D ## Note: DIC is the DIC3 of Celeaux et. al. (2006) 
##D ## for option = "dp".  Finally, the constructed fixed
##D ## and random effects matrices, X and Z, are returned 
##D ## with growth curve covariates appended 
##D ## to user submitted nuisance covariates. 
##D summary.results = summary(res)
##D ## View the summary results in the console
##D print(summary.results)
##D ## Collect posterior sampled values over 
##D ## the (n.iter - n.burn) retained iterations 
##D ## for each sampled parameter.  
##D samples.posterior	= samples(res)
##D ## model residuals (y - fit)
##D residuals		= resid(res) 
##D ## Model with DP on clients effects, but 
##D ## now INCLUDE session random effects
##D ## in a multiple membership construction 
##D ## communicated with the N x S matrix, W.subj.aff.
##D ## Returns object, res.mm, of class "dpgrowmm".
##D shape.dp	= 4
##D strength.mm	= 0.1
##D res.mm	= dpgrowmm(y = datsim$y, subject = datsim$subject, 
##D                      trt = datsim$trt, time = datsim$time, 
##D 		n.random = 3, 
##D 		Omega = datsim$Omega, group = datsim$group, 
##D 		subj.aff = datsim$subj.aff,
##D 		W.subj.aff = datsim$W.subj.aff, 
##D 		n.iter = 10000, n.burn = 2000, n.thin = 10,
##D 		strength.mm = strength.mm, 
##D 		shape.dp = shape.dp, 
##D 		option = "mmcar")
##D plot.results		= plot(res.mm)
## End(Not run)




