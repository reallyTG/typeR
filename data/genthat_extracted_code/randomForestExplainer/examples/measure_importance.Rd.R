library(randomForestExplainer)


### Name: measure_importance
### Title: Importance of variables in a random forest
### Aliases: measure_importance

### ** Examples

forest <- randomForest::randomForest(Species ~ ., data = iris, localImp = TRUE, ntree = 300)
measure_importance(forest)




