library(CustomerScoringMetrics)


### Name: cumGainsChart
### Title: Plot a cumulative gains chart
### Aliases: cumGainsChart

### ** Examples

## Load response modeling predictions
data("response")
## Apply cumGainschart function to visualize cumulative gains of a customer response model
cumGainsChart(response$test[,2],response$test[,1])




