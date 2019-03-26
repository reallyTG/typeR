library(RoughSets)


### Name: D.global.discernibility.heuristic.RST
### Title: Supervised discretization based on the maximum discernibility
###   heuristic
### Aliases: D.global.discernibility.heuristic.RST

### ** Examples

#################################################################
## Example: Determine cut values and generate new decision table
#################################################################
data(RoughSetData)
wine.data <- RoughSetData$wine.dt
cut.values <- D.global.discernibility.heuristic.RST(wine.data)

## generate a new decision table:
wine.discretized <- SF.applyDecTable(wine.data, cut.values)
dim(wine.discretized)
lapply(wine.discretized, unique)

## remove attributes with only one possible value:
to.rm.idx <- which(sapply(lapply(wine.discretized, unique), function(x) length(x) == 1))
to.rm.idx
wine.discretized.reduced <- wine.discretized[-to.rm.idx]
dim(wine.discretized.reduced)

## check whether the attributes in the reduced data are a super-reduct of the original data:
colnames(wine.discretized.reduced)
class.idx <- which(colnames(wine.discretized.reduced) == "class")
sum(duplicated(wine.discretized.reduced)) == sum(duplicated(wine.discretized.reduced[-class.idx]))
## yes it is



