library(LICORS)


### Name: mixed_LICORS
### Title: Mixed LICORS: An EM-like Algorithm for Predictive State Space
###   Estimation
### Aliases: mixed_LICORS
### Keywords: cluster distribution multivariate nonparametric

### ** Examples

## Not run: 
##D data(contCA00)
##D 
##D LC_geom <- setup_LC_geometry(speed = 1, horizon = list(PLC = 2, FLC = 0), 
##D     shape = "cone")
##D bb <- data2LCs(t(contCA00$observed), LC.coordinates = LC_geom$coordinates)
##D 
##D mm <- mixed_LICORS(bb, num.states.init = 15, init = "KmeansPLC", 
##D     control = list(max.iter = 50, lambda = 0.001))
##D plot(mm)
##D ff_new <- estimate_LC_pdfs(bb$FLC, weight.matrix = mm$conditional_state_probs, 
##D     method = "nonparametric")
##D matplot(bb$FLC, ff_new, pch = ".", cex = 2)
## End(Not run)



