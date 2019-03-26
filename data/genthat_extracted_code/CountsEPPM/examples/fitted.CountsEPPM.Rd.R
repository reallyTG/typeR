library(CountsEPPM)


### Name: fitted.CountsEPPM
### Title: Extraction of fitted values from CountsEPPM Objects
### Aliases: fitted.CountsEPPM
### Keywords: methods

### ** Examples

data("herons.group") 
output.fn  <- CountsEPPM(number.attempts ~ 0 + group,
 herons.group, model.type = 'mean only', model.name = 'Poisson')
cooks.distance(output.fn)
fitted(output.fn)



