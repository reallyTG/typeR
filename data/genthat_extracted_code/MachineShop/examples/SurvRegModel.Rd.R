library(MachineShop)


### Name: SurvRegModel
### Title: Parametric Survival Model
### Aliases: SurvRegModel SurvRegStepAICModel

### ** Examples

library(survival)
library(MASS)

fit(Surv(time, status != 2) ~ sex + age + year + thickness + ulcer,
    data = Melanoma, model = SurvRegModel())




