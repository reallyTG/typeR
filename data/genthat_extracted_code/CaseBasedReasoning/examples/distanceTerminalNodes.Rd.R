library(CaseBasedReasoning)


### Name: distanceTerminalNodes
### Title: Calculate terminal node distance for each tree and terminal
### Aliases: distanceTerminalNodes

### ** Examples

require(ranger)
rf.fit <- ranger(Species ~ ., data = iris, num.trees = 5, write.forest = TRUE)
d <- distanceTerminalNodes(rf.fit)




