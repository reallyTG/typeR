library(randomForestExplainer)


### Name: important_variables
### Title: Extract k most important variables in a random forest
### Aliases: important_variables

### ** Examples

forest <- randomForest::randomForest(Species ~ ., data = iris, localImp = TRUE, ntree = 300)
important_variables(measure_importance(forest), k = 2)




