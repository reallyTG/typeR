library(CountsEPPM)


### Name: vcov.CountsEPPM
### Title: Variance/Covariance Matrix for Coefficients
### Aliases: vcov.CountsEPPM
### Keywords: models

### ** Examples

data("herons.group") 
output.fn  <- CountsEPPM(number.attempts ~ 0 + group,
 herons.group, model.type = 'mean only', model.name = 'Poisson')
vcov(output.fn)



