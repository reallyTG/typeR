library(RoughSets)


### Name: D.discretize.equal.intervals.RST
### Title: Unsupervised discretization into intervals of equal length.
### Aliases: D.discretize.equal.intervals.RST

### ** Examples

#################################################################
## Example: Determine cut values and generate new decision table
#################################################################
data(RoughSetData)
wine.data <- RoughSetData$wine.dt
cut.values <- D.discretize.equal.intervals.RST(wine.data, nOfIntervals = 3)

## generate a new decision table
wine.discretized <- SF.applyDecTable(wine.data, cut.values)
dim(wine.discretized)
lapply(wine.discretized, unique)



