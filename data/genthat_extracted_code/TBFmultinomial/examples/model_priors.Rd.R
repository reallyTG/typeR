library(TBFmultinomial)


### Name: model_priors
### Title: Prior model probability
### Aliases: model_priors

### ** Examples

# the definition of the full model with three potential predictors:
FULL <- outcome ~ ns(day, df = 4) + gender + type + SOFA
# here we define time as a spline with 3 knots

priors <- model_priors(fullModel = FULL, discreteSurv = TRUE,
                       modelPrior = 'dependent')



