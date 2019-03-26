library(CountsEPPM)


### Name: print.summaryCountsEPPM
### Title: Printing of summaryCountsEPPM Objects
### Aliases: print.summaryCountsEPPM
### Keywords: IO

### ** Examples

data("herons.group") 
output.fn  <- CountsEPPM(number.attempts ~ 0 + group,
 herons.group, model.type = 'mean only', model.name = 'Poisson')
print(summary(output.fn))



