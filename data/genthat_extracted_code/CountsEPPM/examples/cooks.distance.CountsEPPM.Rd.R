library(CountsEPPM)


### Name: cooks.distance.CountsEPPM
### Title: Cook's distance for CountsEPPM Objects
### Aliases: cooks.distance.CountsEPPM
### Keywords: methods

### ** Examples

data("herons.group") 
output.fn  <- CountsEPPM(number.attempts ~ 0 + group,
 herons.group, model.type = 'mean only', model.name = 'Poisson')
cooks.distance(output.fn)



