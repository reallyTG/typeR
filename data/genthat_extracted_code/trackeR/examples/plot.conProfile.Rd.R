library(trackeR)


### Name: plot.conProfile
### Title: Plot concentration profiles.
### Aliases: plot.conProfile

### ** Examples

data('runs', package = 'trackeR')
dProfile <- distributionProfile(runs, session = 1:3, what = 'speed',
                                grid = seq(0, 12.5, by = 0.05))
cProfile <- concentrationProfile(dProfile)
## Not run: 
##D plot(cProfile, smooth = FALSE)
##D plot(cProfile)
## End(Not run)



