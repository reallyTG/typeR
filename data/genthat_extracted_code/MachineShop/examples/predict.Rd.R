library(MachineShop)


### Name: predict
### Title: Model Prediction
### Aliases: predict predict.MLModelFit

### ** Examples

## Survival response example
library(survival)
library(MASS)

gbmfit <- fit(Surv(time, status != 2) ~ sex + age + year + thickness + ulcer,
              data = Melanoma, model = GBMModel)
predict(gbmfit, newdata = Melanoma, times = 365 * c(2, 5, 10), type = "prob")




