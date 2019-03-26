library(lmSubsets)


### Name: methods
### Title: Methods for 'lmSubsets' and 'lmSelect' Objects
### Aliases: methods model_response variable.names.lmSubsets
###   formula.lmSubsets model.frame.lmSubsets model.matrix.lmSubsets
###   model_response.lmSubsets refit.lmSubsets deviance.lmSubsets
###   sigma.lmSubsets logLik.lmSubsets AIC.lmSubsets BIC.lmSubsets
###   coef.lmSubsets vcov.lmSubsets fitted.lmSubsets residuals.lmSubsets
###   variable.names.lmSelect formula.lmSelect model.frame.lmSelect
###   model.matrix.lmSelect model_response.lmSelect refit.lmSelect
###   deviance.lmSelect sigma.lmSelect logLik.lmSelect AIC.lmSelect
###   BIC.lmSelect coef.lmSelect vcov.lmSelect fitted.lmSelect
###   residuals.lmSelect
### Keywords: regression

### ** Examples

## load data
data("AirPollution", package = "lmSubsets")

## fit subsets (5 best subsets per size)
lm_all <- lmSubsets(mortality ~ ., data = AirPollution, nbest = 5)

## extract information (for best submodel of size 3)
coef(lm_all, size = 3)
vcov(lm_all, size = 3)
residuals(lm_all, size = 3)
fitted(lm_all, size = 3)
model.matrix(lm_all, size = 3)

## select best (BIC) submodels
lm_best <- lmSelect(lm_all)

## extract information
deviance(lm_best)
logLik(lm_best)
AIC(lm_best)
BIC(lm_best, best = 1:5)

## refit model
lm5 <- refit(lm_all, size = 5)
summary(lm5)
## (Note that the p-values are not valid due to model selection.)



