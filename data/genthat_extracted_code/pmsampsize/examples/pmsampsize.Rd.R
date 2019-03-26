library(pmsampsize)


### Name: pmsampsize
### Title: pmsampsize - Calculates the minimum sample size required for
###   developing a multivariable prediction model
### Aliases: pmsampsize

### ** Examples

## Examples based on those included in two papers by Riley et al. 
## published in Statistics in Medicine (2018).

## Binary outcomes (Logistic prediction models)
# Use pmsampsize to calculate the minimum sample size required to develop a
# multivariable prediction model for a binary outcome using 24 candidate
# predictor parameters. Based on previous evidence, the outcome prevalence is
# anticipated to be 0.174 (17.4%) and a lower bound (taken from the adjusted
# Cox-Snell R-squared of an existing prediction model) for the new model's
# R-squared value is 0.288

pmsampsize(type = "b", rsquared = 0.288, parameters = 24, prevalence = 0.174)

## Survial outcomes (Cox prediction models)
# Use pmsampsize to calculate the minimum sample size required for developing
# a multivariable prediction model with a survival outcome using 25 candidate
# predictors. We know an existing prediction model in the same field has an
# R-squared adjusted of 0.051. Further, in the previous study the mean
# follow-up was 2.07 years, and overall event rate was 0.065. We select a
# timepoint of interest for prediction using the newly developed model of 2
# years

pmsampsize(type = "s", rsquared = 0.051, parameters = 25, rate = 0.065, 
           timepoint = 2, meanfup = 2.07)

## Continuous outcomes (Linear prediction models)
# Use pmsampsize to calculate the minimum sample size required for developing
# a multivariable prediction model for a continuous outcome (here, FEV1 say),
# using 25 candidate predictors.  We know an existing prediction model in the
# same field has an R-squared adjusted of 0.2, and that FEV1 values in the
# population have a mean of 1.9 and SD of 0.6

pmsampsize(type = "c", rsquared = 0.2, parameters = 25, intercept = 1.9, sd = 0.6)




