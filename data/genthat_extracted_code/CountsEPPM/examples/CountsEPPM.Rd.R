library(CountsEPPM)


### Name: CountsEPPM
### Title: Fitting of EPPM models to count data.
### Aliases: CountsEPPM
### Keywords: models

### ** Examples

data(herons.group)
initial <- c(0.5623042, 0.4758576, 0.5082486)
names(initial) <- c("Adult mean", "Immature mean", "log(b)")
output.fn <- CountsEPPM(number.attempts ~ 0 + group,
 herons.group, model.type = 'mean only', model = 'negative binomial',
 initial = initial)
print(output.fn)



