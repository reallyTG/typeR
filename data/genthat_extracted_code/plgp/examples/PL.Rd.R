library(plgp)


### Name: PL
### Title: Particle Learning Skeleton Method
### Aliases: PL plgp PL.env
### Keywords: methods iterations

### ** Examples

## See the demos via demo(package="plgp"); it is important to
## run them with the ask=FALSE argument so that the
## automatically generated plots may refresh automatically
## (without requiring the user to press RETURN)
## Not run: 
##D ## Illustrates regression GPs on a simple 1-d sinusoidal
##D ## data generating mechanism
##D demo("plgp_sin1d", ask=FALSE)
##D 
##D ## Illustrates classification GPs on a simple 2-d exponential
##D ## data generating mechanism
##D demo("plcgp_exp", ask=FALSE)
##D 
##D ## Illustrates classification GPs on Ripley's Cushings data
##D demo("plcgp_cush", ask=FALSE)
##D 
##D ## Illustrates active learning via the expected improvement
##D ## statistic on a simple 1-d data generating mechanism
##D demo("plgp_exp_ei", ask=FALSE)
##D 
##D ## Illustrates active learning via entropy with classification
##D ## GPs on a simple 2-d exponential data generating mechanism
##D demo("plcgp_exp_entropy", ask=FALSE)
##D 
##D ## Illustrates active learning via the integrated expected
##D ## conditional improvement statistic for optimization
##D ## under known constraints on a simple 1-d data generating
##D ## mechanism
##D demo("plgp_1d_ieci", ask=FALSE)
##D 
##D ## Illustrates active learning via the integrated expected
##D ## conditional improvement statistic for optimization under
##D ## unknown constraints on a simple 1-d data generating
##D ## mechanism
##D demo("plconstgp_1d_ieci", ask=FALSE)
##D 
##D ## Illustrates active learning via the integrated expected
##D ## conditional improvement statistic for optimization under
##D ## unknokn constraints on a simple 2-d data generating
##D ## mechanism
##D demo("plconstgp_2d_ieci", ask=FALSE)
## End(Not run)



