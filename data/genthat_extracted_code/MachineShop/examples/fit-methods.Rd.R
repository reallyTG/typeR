library(MachineShop)


### Name: fit
### Title: Model Fitting
### Aliases: fit fit.formula fit.ModelFrame fit.recipe

### ** Examples

## Survival response example
library(survival)
library(MASS)

gbmfit <- fit(Surv(time, status != 2) ~ sex + age + year + thickness + ulcer,
              data = Melanoma, model = GBMModel)
varimp(gbmfit)




