library(EmpiricalCalibration)


### Name: plotCiCalibrationEffect
### Title: Plot true and observed values
### Aliases: plotCiCalibrationEffect

### ** Examples

data <- simulateControls(n = 50 * 3, mean = 0.25, sd = 0.25, trueLogRr = log(c(1, 2, 4)))
plotCiCalibrationEffect(data$logRr, data$seLogRr, data$trueLogRr)




