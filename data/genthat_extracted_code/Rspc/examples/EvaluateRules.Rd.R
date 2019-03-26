library(Rspc)


### Name: EvaluateRules
### Title: EvaluateRules
### Aliases: EvaluateRules

### ** Examples

# Evaluate data, use all 8 Nelson rules, limits are specified by user
EvaluateRules(x = rnorm(10), whichRules = 1:8, lcl = 0, cl = 50, ucl = 100)
#Evaluate only rule 1, 3, 5, calculate limits from data using c-chart formula,
#use 2 sigma instead of 3, modify default behaviour of rule by pars variable
#created by function SetParameters()
pars = SetParameters()
EvaluateRules(x = rpois(10, lambda = 15), type = 'c', whichRules = c(1,3,5), lcl = NA, cl = NA,
ucl = NA, controlLimitDistance = 2, parRules = pars)
# pars is object of optional parameters created by SetParameters() function



