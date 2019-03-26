library(reliaR)


### Name: MOEEsurvival
### Title: Survival related functions for the Marshall-Olkin Extended
###   Exponential (MOEE) distribution
### Aliases: MOEEsurvival crf.moee hmoee hra.moee smoee
### Keywords: survival

### ** Examples

## Load data sets
data(stress)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 75.67982, lambda.est = 1.67576
smoee(stress, 75.67982, 1.67576)
hmoee(stress, 75.67982, 1.67576)
hra.moee(stress, 75.67982, 1.67576)
crf.moee(stress, 3.00, 75.67982, 1.67576)



