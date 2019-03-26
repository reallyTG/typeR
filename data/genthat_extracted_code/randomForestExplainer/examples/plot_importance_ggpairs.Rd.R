library(randomForestExplainer)


### Name: plot_importance_ggpairs
### Title: Plot importance measures with ggpairs
### Aliases: plot_importance_ggpairs

### ** Examples

forest <- randomForest::randomForest(Species ~ ., data = iris, localImp = TRUE, ntree = 200)
frame <- measure_importance(forest, measures = c("mean_min_depth", "times_a_root"))
plot_importance_ggpairs(frame, measures = c("mean_min_depth", "times_a_root"))




