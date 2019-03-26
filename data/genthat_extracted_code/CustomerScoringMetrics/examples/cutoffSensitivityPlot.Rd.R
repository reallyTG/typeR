library(CustomerScoringMetrics)


### Name: cutoffSensitivityPlot
### Title: Plot a sensitivity plot for cutoff values
### Aliases: cutoffSensitivityPlot

### ** Examples

## Load response modeling predictions
data("response")
## Apply cutoffSensitivityPlot function to visualize how the cutoff value influences
## accuracy.
cutoffSensitivityPlot(response$test[,2],response$test[,1],metric="accuracy")
## Same exercise, but in function of misclassification costs
costs <- runif(nrow(response$test), 1, 50)
cutoffSensitivityPlot(response$test[,2],response$test[,1],metric="misclassCost",
costType="costVector",costs=costs, resolution=1/10)




