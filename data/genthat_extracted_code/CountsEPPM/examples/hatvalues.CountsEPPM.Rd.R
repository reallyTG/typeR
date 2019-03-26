library(CountsEPPM)


### Name: hatvalues.CountsEPPM
### Title: Extraction of hat matrix values from CountsEPPM Objects
### Aliases: hatvalues.CountsEPPM
### Keywords: methods

### ** Examples

data("herons.group") 
output.fn  <- CountsEPPM(number.attempts ~ 0 + group,
 herons.group, model.type = 'mean only', model.name = 'Poisson')
cooks.distance(output.fn)
hatvalues(output.fn)



