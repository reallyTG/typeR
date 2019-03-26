library(EmpiricalCalibration)


### Name: plotTrueAndObserved
### Title: Plot true and observed values
### Aliases: plotTrueAndObserved

### ** Examples

data <- simulateControls(n = 50 * 3, mean = 0.25, sd = 0.25, trueLogRr = log(c(1, 2, 4)))
plotTrueAndObserved(data$logRr, data$seLogRr, data$trueLogRr)




