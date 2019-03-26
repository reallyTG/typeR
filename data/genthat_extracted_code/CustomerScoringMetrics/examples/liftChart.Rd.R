library(CustomerScoringMetrics)


### Name: liftChart
### Title: Generate a lift chart
### Aliases: liftChart

### ** Examples

## Load response modeling predictions
data("response")
## Apply liftChart function to visualize lift table results
liftChart(response$test[,2],response$test[,1])




