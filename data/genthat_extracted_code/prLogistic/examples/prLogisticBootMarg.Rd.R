library(prLogistic)


### Name: prLogisticBootMarg
### Title: Estimation of Prevalence Ratios using Logistic Models and
###   Bootstrap Confidence Intervals for Marginal Standardization
### Aliases: prLogisticBootMarg
### Keywords: distribution regression

### ** Examples

### For independent observations:
## Estimates from logistic regression with bootstrap confidence intervals -
## marginal standardization
# Not run:
# data("titanic", package = "prLogistic")
# attach(titanic)
# fit.logistic=glm(survived~ sex + pclass + embarked, family=binomial, 
# data = titanic)
# prLogisticBootMarg(fit.logistic, data = titanic)
# End (Not run:)

# Another way for fitting the same model:
# Not run:
# prLogisticBootMarg(glm(survived~ sex + pclass + embarked, 
# family=binomial, data = titanic), data=titanic)
# End (Not run:)
 
### For clustered data
# Estimates from random-effects logistic regression 
## with bootstrap confidence intervals - marginal standardization
# Not run:
# library(lme4)
# data("Thailand", package = "prLogistic")
# attach(Thailand)
# ML = glmer(rgi ~  sex + pped  + (1|schoolid), 
# family = binomial, data = Thailand)
 			
# prLogisticBootMarg(ML, data = Thailand)
# End (Not run:)



