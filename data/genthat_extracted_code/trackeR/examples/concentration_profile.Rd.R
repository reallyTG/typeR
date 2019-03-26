library(trackeR)


### Name: concentration_profile
### Title: Generic method for concentration profiles
### Aliases: concentration_profile concentrationProfile

### ** Examples

## Not run: 
##D ## Compute conecntration profiles from distribution profiles
##D data('run', package = 'trackeR')
##D dProfile <- distributionProfile(run, what = 'speed', grid = seq(0, 12.5, by = 0.05))
##D cProfile <- concentrationProfile(dProfile)
##D plot(cProfile, smooth = FALSE)
##D plot(cProfile)
##D 
##D ## And now directly from the 'trackeRdata' object, which is a
##D ## considerably faster if all that is needed are the concentration
##D ## profiles
##D cProfile <- concentrationProfile(runs, what = 'speed',
##D                                  limits = list(speed = c(0, 12.5)))
##D plot(cProfile, smooth = FALSE)
##D ridges(cProfile)
##D plot(cProfile, smooth = TRUE)
## End(Not run)



