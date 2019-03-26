library(xgboost)


### Name: xgb.ggplot.deepness
### Title: Plot model trees deepness
### Aliases: xgb.ggplot.deepness xgb.plot.deepness

### ** Examples


data(agaricus.train, package='xgboost')

# Change max_depth to a higher number to get a more significant result
bst <- xgboost(data = agaricus.train$data, label = agaricus.train$label, max_depth = 6,
               eta = 0.1, nthread = 2, nrounds = 50, objective = "binary:logistic",
               subsample = 0.5, min_child_weight = 2)

xgb.plot.deepness(bst)
xgb.ggplot.deepness(bst)

xgb.plot.deepness(bst, which='max.depth', pch=16, col=rgb(0,0,1,0.3), cex=2)

xgb.plot.deepness(bst, which='med.weight', pch=16, col=rgb(0,0,1,0.3), cex=2)




