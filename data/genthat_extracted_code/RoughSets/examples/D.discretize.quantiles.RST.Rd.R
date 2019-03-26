library(RoughSets)


### Name: D.discretize.quantiles.RST
### Title: The quantile-based discretization
### Aliases: D.discretize.quantiles.RST

### ** Examples

#################################################################
## Example: Determine cut values and generate new decision table
#################################################################
data(RoughSetData)
wine.data <- RoughSetData$wine.dt
cut.values <- D.discretize.quantiles.RST(wine.data, nOfIntervals = 5)

## generate a new decision table
wine.discretized <- SF.applyDecTable(wine.data, cut.values)
dim(wine.discretized)
lapply(wine.discretized, unique)



