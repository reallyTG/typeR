library(EmpiricalCalibration)


### Name: fitSystematicErrorModel
### Title: Fit a systematic error model
### Aliases: fitSystematicErrorModel

### ** Examples

controls <- simulateControls(n = 50 * 3, mean = 0.25, sd = 0.25, trueLogRr = log(c(1, 2, 4)))
model <- fitSystematicErrorModel(controls$logRr, controls$seLogRr, controls$trueLogRr)
model




