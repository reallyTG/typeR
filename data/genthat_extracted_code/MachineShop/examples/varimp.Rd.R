library(MachineShop)


### Name: varimp
### Title: Variable Importance
### Aliases: varimp

### ** Examples

## Survival response example
library(survival)
library(MASS)

gbmfit <- fit(Surv(time, status != 2) ~ sex + age + year + thickness + ulcer,
              data = Melanoma, model = GBMModel)
(vi <- varimp(gbmfit))
plot(vi)




