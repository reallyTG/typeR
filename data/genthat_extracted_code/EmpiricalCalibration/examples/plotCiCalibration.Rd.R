library(EmpiricalCalibration)


### Name: plotCiCalibration
### Title: Create a confidence interval calibration plot
### Aliases: plotCiCalibration

### ** Examples

## Not run: 
##D data <- simulateControls(n = 50 * 3, mean = 0.25, sd = 0.25, trueLogRr = log(c(1, 2, 4)))
##D plotCiCalibration(data$logRr, data$seLogRr, data$trueLogRr)
## End(Not run)



