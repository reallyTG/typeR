library(randomForestExplainer)


### Name: plot_min_depth_interactions
### Title: Plot the top mean conditional minimal depth
### Aliases: plot_min_depth_interactions

### ** Examples

forest <- randomForest::randomForest(Species ~ ., data = iris, ntree = 100)
plot_min_depth_interactions(min_depth_interactions(forest, c("Petal.Width", "Petal.Length")))




