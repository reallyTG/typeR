library(prLogistic)


### Name: prLogisticDelta
### Title: Estimation of Prevalence Ratios using Logistic Models and
###   Confidence Intervals with Delta Method
### Aliases: prLogisticDelta
### Keywords: distribution regression

### ** Examples

### For independent observations:
# Estimates from logistic regression with conditional standardization - 
# delta method
# Not run:
# data("titanic", package = "prLogistic")
# attach(titanic)
# prLogisticDelta(survived~ sex + pclass + embarked, data = titanic)
# End (Not run:)

# Estimates from logistic regression with marginal standardization - 
# delta method
 prLogisticDelta(survived~ sex + pclass + embarked, 
 data = titanic, pattern="marginal")


### For clustered data
# Estimates from random-effects logistic regression with conditional 
# standardization - delta method
# Not run:
# data("Thailand", package = "prLogistic")
# prLogisticDelta(rgi~  sex + pped + (1|schoolid), 
# data = Thailand, cluster=TRUE)
# End (Not run:)

# Estimates from random-effects logistic regression with marginal 
# Not run:
# standardization -  delta method
# prLogisticDelta(rgi ~  sex + pped + (1|schoolid), data = Thailand,
# pattern="marginal", cluster=TRUE)
# End (Not run:)



