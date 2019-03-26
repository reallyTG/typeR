library(CountsEPPM)


### Name: print.CountsEPPM
### Title: Printing of CountsEPPM Objects
### Aliases: print.CountsEPPM
### Keywords: IO

### ** Examples

data("herons.group") 
output.fn  <- CountsEPPM(number.attempts ~ 0 + group,
 herons.group, model.type = 'mean only', model.name = 'Poisson')
print(output.fn)



