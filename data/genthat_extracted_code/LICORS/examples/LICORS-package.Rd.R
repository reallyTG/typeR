library(LICORS)


### Name: LICORS-package
### Title: Light Cone Reconstruction of States - Predictive State
###   Estimation From Spatio-Temporal Data
### Aliases: LICORS LICORS-package
### Keywords: package

### ** Examples

## Not run: 
##D # setup the light cone geometry
##D LC_geom <- setup_LC_geometry(speed = 1, horizon = list(PLC = 2, FLC = 0), 
##D     shape = "cone")
##D # load the field
##D data(contCA00)
##D # get LC configurations from field
##D contCA_LCs <- data2LCs(contCA00$observed, LC.coordinates = LC_geom$coordinates)
##D # run mixed LICORS
##D 
##D mod <- mixed_LICORS(contCA_LCs, num.states_start = 10, initialization = "KmeansPLC", 
##D     max_iter = 20)
##D 
##D plot(mod)
## End(Not run)



