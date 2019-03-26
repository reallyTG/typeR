library(randomForestExplainer)


### Name: plot_min_depth_distribution
### Title: Plot the distribution of minimal depth in a random forest
### Aliases: plot_min_depth_distribution

### ** Examples

forest <- randomForest::randomForest(Species ~ ., data = iris, ntree = 300)
plot_min_depth_distribution(min_depth_distribution(forest))




