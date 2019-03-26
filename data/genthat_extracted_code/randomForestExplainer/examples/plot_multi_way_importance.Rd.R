library(randomForestExplainer)


### Name: plot_multi_way_importance
### Title: Multi-way importance plot
### Aliases: plot_multi_way_importance

### ** Examples

forest <- randomForest::randomForest(Species ~ ., data = iris, localImp = TRUE)
plot_multi_way_importance(measure_importance(forest))




