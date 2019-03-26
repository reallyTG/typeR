library(ranger)


### Name: getTerminalNodeIDs
### Title: Get terminal node IDs (deprecated)
### Aliases: getTerminalNodeIDs

### ** Examples

library(ranger)
rf <- ranger(Species ~ ., data = iris, num.trees = 5, write.forest = TRUE)
getTerminalNodeIDs(rf, iris)



