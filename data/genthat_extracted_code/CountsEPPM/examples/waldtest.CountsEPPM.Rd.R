library(CountsEPPM)


### Name: waldtest.CountsEPPM
### Title: Wald Test of Nested Models for CountsEPPM Objects
### Aliases: waldtest.CountsEPPM
### Keywords: methods

### ** Examples

data("herons.group")
## Not run: 
##D output.fn  <- CountsEPPM(number.attempts ~ 0 + group,
##D  herons.group, model.type = 'mean only', model.name = 'Poisson')
##D output.fn.one  <- CountsEPPM(number.attempts ~ 0 + group,
##D  herons.group, model.type = 'mean only',
##D  model.name = 'negative binomial')
##D waldtest(output.fn, output.fn.one, test = c("Chisq", "F"), vcov =  vcov) 
## End(Not run)       



