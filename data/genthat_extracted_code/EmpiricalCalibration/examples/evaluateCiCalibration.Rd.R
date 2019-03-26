library(EmpiricalCalibration)


### Name: evaluateCiCalibration
### Title: Evaluate confidence interval calibration
### Aliases: evaluateCiCalibration

### ** Examples

## Not run: 
##D data <- simulateControls(n = 50 * 3, mean = 0.25, sd = 0.25, trueLogRr = log(c(1, 2, 4)))
##D eval <- evaluateCiCalibration(data$logRr, data$seLogRr, data$trueLogRr)
## End(Not run)



