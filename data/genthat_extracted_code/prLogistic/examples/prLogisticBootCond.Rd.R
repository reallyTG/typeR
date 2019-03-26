library(prLogistic)


### Name: prLogisticBootCond
### Title: Estimation of Prevalence Ratios using Logistic Models and
###   Bootstrap Confidence Intervals for Conditional Standardization
### Aliases: prLogisticBootCond
### Keywords: distribution regression

### ** Examples

# Estimates from logistic regression with bootstrap confidence intervals -
## conditional standardization
# Not run:
# data("titanic", package = "prLogistic")
# attach(titanic)
# fit.logistic=glm(survived~ sex + pclass + embarked, family=binomial, 
# data = titanic)
# prLogisticBootCond(fit.logistic, data = titanic)
# End (Not run:)

# Another way for fitting the same model:
# Not run:
# prLogisticBootCond(glm(survived~ sex + pclass + embarked, family=binomial, 
# data = titanic), data=titanic)
# End (Not run:)

### For clustered data
# Estimates from random-effects logistic regression 
## with bootstrap confidence intervals - conditional standardization
 # Not run:
 # library(lme4)
 # data("Thailand", package = "prLogistic")
 # attach(Thailand)
 # ML = glmer(rgi ~  sex + pped  + (1|schoolid), 
 # family = binomial, data = Thailand)

 # prLogisticBootCond(ML, data = Thailand)
 # End (Not run:)



