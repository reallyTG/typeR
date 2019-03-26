library(CaseBasedReasoning)


### Name: weightedDistance
### Title: Weighted Distance calculation
### Aliases: weightedDistance

### ** Examples

require(ranger)
rf <- ranger(Species ~ ., data = iris, num.trees = 5, write.forest = TRUE)
nodeID <- terminalNodeIDs(iris[, -5], rf)




