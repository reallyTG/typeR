library(xgboost)


### Name: xgb.importance
### Title: Importance of features in a model.
### Aliases: xgb.importance

### ** Examples


# binomial classification using gbtree:
data(agaricus.train, package='xgboost')
bst <- xgboost(data = agaricus.train$data, label = agaricus.train$label, max_depth = 2, 
               eta = 1, nthread = 2, nrounds = 2, objective = "binary:logistic")
xgb.importance(model = bst)

# binomial classification using gblinear:
bst <- xgboost(data = agaricus.train$data, label = agaricus.train$label, booster = "gblinear", 
               eta = 0.3, nthread = 1, nrounds = 20, objective = "binary:logistic")
xgb.importance(model = bst)

# multiclass classification using gbtree:
nclass <- 3
nrounds <- 10
mbst <- xgboost(data = as.matrix(iris[, -5]), label = as.numeric(iris$Species) - 1,
               max_depth = 3, eta = 0.2, nthread = 2, nrounds = nrounds,
               objective = "multi:softprob", num_class = nclass)
# all classes clumped together:
xgb.importance(model = mbst)
# inspect importances separately for each class:
xgb.importance(model = mbst, trees = seq(from=0, by=nclass, length.out=nrounds))
xgb.importance(model = mbst, trees = seq(from=1, by=nclass, length.out=nrounds))
xgb.importance(model = mbst, trees = seq(from=2, by=nclass, length.out=nrounds))

# multiclass classification using gblinear:
mbst <- xgboost(data = scale(as.matrix(iris[, -5])), label = as.numeric(iris$Species) - 1,
               booster = "gblinear", eta = 0.2, nthread = 1, nrounds = 15,
               objective = "multi:softprob", num_class = nclass)
xgb.importance(model = mbst)




