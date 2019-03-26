library(MachineShop)


### Name: CoxModel
### Title: Proportional Hazards Regression Model
### Aliases: CoxModel CoxStepAICModel

### ** Examples

library(survival)
library(MASS)

fit(Surv(time, status != 2) ~ sex + age + year + thickness + ulcer,
    data = Melanoma, model = CoxModel())




