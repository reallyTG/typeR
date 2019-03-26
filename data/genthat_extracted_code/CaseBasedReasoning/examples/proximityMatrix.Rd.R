library(CaseBasedReasoning)


### Name: proximityMatrix
### Title: Get proximity matrix of an ranger object
### Aliases: proximityMatrix

### ** Examples

require(ranger)
rf <- ranger(Species ~ ., data = iris, num.trees = 5, write.forest = TRUE)
d <- proximityMatrix(x = iris[, -5], rfObject = rf)

set.seed(1234L)
learn <- sample(1:150, 100)
test <- (1:150)[-learn]
rf <- ranger(Species ~ ., data = iris[learn, ], num.trees = 500, write.forest = TRUE)
d <- proximityMatrix(x = iris[learn, -5], y = iris[test, -5], rfObject = rf)




