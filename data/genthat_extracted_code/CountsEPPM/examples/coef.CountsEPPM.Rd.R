library(CountsEPPM)


### Name: coef.CountsEPPM
### Title: Extraction of model coefficients for CountsEPPM Objects
### Aliases: coef.CountsEPPM
### Keywords: methods

### ** Examples

data(herons.group)
output.fn  <- CountsEPPM(number.attempts ~ 0 + group,
 herons.group, model.type = 'mean only', model.name = 'Poisson')
coef(output.fn, prtpar = "full")
coef(output.fn, prtpar = "mean")
coef(output.fn, prtpar = "scale.factor")



