library(CaseBasedReasoning)


### Name: depthMatrix
### Title: Get depth distance matrix
### Aliases: depthMatrix

### ** Examples

require(ranger)
rf <- ranger(Species ~ ., data = iris, num.trees = 5, write.forest = TRUE)
d <- depthMatrix(x=iris[, -5], rfObject=rf)




