library(bbefkr)


### Name: bayMCMC_semi_global
### Title: Bayesian bandwidth estimation for a semi-functional partial
###   linear model
### Aliases: bayMCMC_semi_global
### Keywords: method

### ** Examples

htm = proc.time()
dum = bayMCMC_semi_global(data_x = simcurve_smooth_normerr, data_y = simresp_semi_normerr, 
	data_xnew = simcurve_smooth_normerr, Xvar = Xvar, warm = 50, M = 100, range.grid=c(0,pi), 
	q=2, nknot=20)
proc.time() - htm



