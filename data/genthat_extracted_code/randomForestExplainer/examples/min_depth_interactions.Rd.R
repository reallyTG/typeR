library(randomForestExplainer)


### Name: min_depth_interactions
### Title: Calculate mean conditional minimal depth
### Aliases: min_depth_interactions

### ** Examples

forest <- randomForest::randomForest(Species ~ ., data = iris, ntree = 100)
min_depth_interactions(forest, c("Petal.Width", "Petal.Length"))




