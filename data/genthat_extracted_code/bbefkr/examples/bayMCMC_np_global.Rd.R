library(bbefkr)


### Name: bayMCMC_np_global
### Title: Bayesian bandwidth estimation for a functional nonparametric
###   regression with homoscedastic errors
### Aliases: bayMCMC_np_global
### Keywords: method

### ** Examples

htm = proc.time()
dum = bayMCMC_np_global(data_x = simcurve_smooth_normerr, data_y = simresp_np_normerr, 
	data_xnew = simcurve_smooth_normerr,	warm = 50, M = 100, range.grid=c(0,pi), q=2, 
	nknot=20)
proc.time() - htm



