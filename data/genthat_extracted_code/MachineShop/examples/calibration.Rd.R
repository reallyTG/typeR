library(MachineShop)


### Name: calibration
### Title: Model Calibration
### Aliases: calibration Calibration

### ** Examples

library(survival)
library(MASS)

res <- resample(Surv(time, status != 2) ~ sex + age + year + thickness + ulcer,
                data = Melanoma, model = GBMModel,
                control = CVControl(surv_times = 365 * c(2, 5, 10)))
(cal <- calibration(res))
plot(cal)




