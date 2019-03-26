library(randomForestExplainer)


### Name: plot_importance_rankings
### Title: Plot importance measures rankings with ggpairs
### Aliases: plot_importance_rankings

### ** Examples

forest <- randomForest::randomForest(Species ~ ., data = iris, localImp = TRUE, ntree = 300)
frame <- measure_importance(forest, measures = c("mean_min_depth", "times_a_root"))
plot_importance_ggpairs(frame, measures = c("mean_min_depth", "times_a_root"))




