library(CaseBasedReasoning)


### Name: forestToMatrix
### Title: Forest2Matrix
### Aliases: forestToMatrix

### ** Examples

library(ranger)
rf.fit <- ranger(Species ~ ., data = iris, num.trees = 5, write.forest = TRUE)
forestMat <- forestToMatrix(rf.fit)




