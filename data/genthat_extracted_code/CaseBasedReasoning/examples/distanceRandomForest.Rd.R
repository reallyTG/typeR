library(CaseBasedReasoning)


### Name: distanceRandomForest
### Title: Distance calculation based on RandomForest Proximity or Depth
### Aliases: distanceRandomForest

### ** Examples

library(ranger)
# proximity pairwise distances
rf.fit <- ranger(Species ~ ., data = iris, num.trees = 500, write.forest = TRUE)
distanceRandomForest(x = iris[, -5], rfObject = rf.fit, method = "Proximity", threads = 1)

# depth distance for train versus test subset
set.seed(1234L)
learn <- sample(1:150, 100)
test <- (1:150)[-learn]
rf.fit <- ranger(Species ~ ., data = iris[learn, ], num.trees = 500, write.forest = TRUE)
distanceRandomForest(x = iris[learn, -5], y = iris[test, -5], rfObject = rf.fit, method = "Depth")




