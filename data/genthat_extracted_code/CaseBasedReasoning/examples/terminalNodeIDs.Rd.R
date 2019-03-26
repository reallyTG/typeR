library(CaseBasedReasoning)


### Name: terminalNodeIDs
### Title: Get the terminal node id of a RandomForest Object
### Aliases: terminalNodeIDs

### ** Examples

library(ranger)
rf.fit <- ranger(Species ~ ., data = iris, num.trees = 5, write.forest = TRUE)
dfNodes <- terminalNodeIDs(iris[, -5], rf.fit)




