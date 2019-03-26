library(RoughSets)


### Name: D.discretization.RST
### Title: The wrapper function for discretization methods
### Aliases: D.discretization.RST

### ** Examples

#################################################################
## Example: Determine cut values and generate new decision table
#################################################################
data(RoughSetData)
wine.data <- RoughSetData$wine.dt
cut.values1 <- D.discretization.RST(wine.data,
                                   type.method = "unsupervised.quantiles",
                                   nOfIntervals = 3)

## generate a new decision table
wine.discretized1 <- SF.applyDecTable(wine.data, cut.values1)
dim(wine.discretized1)
lapply(wine.discretized1, unique)

cut.values2 <- D.discretization.RST(wine.data,
                                    type.method = "global.discernibility")

wine.discretized2 <- SF.applyDecTable(wine.data, cut.values2)
dim(wine.discretized2)
lapply(wine.discretized2, unique)



