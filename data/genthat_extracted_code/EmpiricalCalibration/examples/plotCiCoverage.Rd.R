library(EmpiricalCalibration)


### Name: plotCiCoverage
### Title: Create a confidence interval coverage plot
### Aliases: plotCiCoverage

### ** Examples

## Not run: 
##D data <- simulateControls(n = 50 * 3, mean = 0.25, sd = 0.25, trueLogRr = log(c(1, 2, 4)))
##D plotCiCoverage(data$logRr, data$seLogRr, data$trueLogRr)
## End(Not run)



