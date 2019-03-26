library(CountsEPPM)


### Name: plot.CountsEPPM
### Title: Diagnostic Plots for CountsEPPM Objects
### Aliases: plot.CountsEPPM
### Keywords: hplot

### ** Examples

## Not run: 
##D data("herons.group") 
##D output.fn  <- CountsEPPM(number.attempts ~ 0 + group,
##D  herons.group, model.type = 'mean only', model.name = 'Poisson')
##D cooks.distance(output.fn)
##D plot(output.fn, which = 1, type= "sdeviance")
## End(Not run)



