library(RoughSets)


### Name: D.local.discernibility.heuristic.RST
### Title: Supervised discretization based on the local discernibility
###   heuristic
### Aliases: D.local.discernibility.heuristic.RST

### ** Examples

#################################################################
## Example: Determine cut values and generate new decision table
#################################################################
data(RoughSetData)
wine.data <- RoughSetData$wine.dt
cut.values <- D.local.discernibility.heuristic.RST(wine.data)

## generate a new decision table:
wine.discretized <- SF.applyDecTable(wine.data, cut.values)
dim(wine.discretized)
lapply(wine.discretized, unique)



