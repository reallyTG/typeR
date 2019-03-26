library(ranger)


### Name: treeInfo
### Title: Tree information in human readable format
### Aliases: treeInfo

### ** Examples

require(ranger)
rf <- ranger(Species ~ ., data = iris)
treeInfo(rf, 1)



