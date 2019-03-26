library(EmpiricalCalibration)


### Name: plotErrorModel
### Title: Plot the systematic error model
### Aliases: plotErrorModel

### ** Examples

data <- simulateControls(n = 50 * 3, mean = 0.25, sd = 0.25, trueLogRr = log(c(1, 2, 4)))
plotErrorModel(data$logRr, data$seLogRr, data$trueLogRr)



