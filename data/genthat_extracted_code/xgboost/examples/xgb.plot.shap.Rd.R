library(xgboost)


### Name: xgb.plot.shap
### Title: SHAP contribution dependency plots
### Aliases: xgb.plot.shap

### ** Examples


data(agaricus.train, package='xgboost')
data(agaricus.test, package='xgboost')

bst <- xgboost(agaricus.train$data, agaricus.train$label, nrounds = 50, 
               eta = 0.1, max_depth = 3, subsample = .5,
               method = "hist", objective = "binary:logistic", nthread = 2, verbose = 0)

xgb.plot.shap(agaricus.test$data, model = bst, features = "odor=none")
contr <- predict(bst, agaricus.test$data, predcontrib = TRUE)
xgb.plot.shap(agaricus.test$data, contr, model = bst, top_n = 12, n_col = 3)

# multiclass example - plots for each class separately:
nclass <- 3
nrounds <- 20
x <- as.matrix(iris[, -5])
set.seed(123)
is.na(x[sample(nrow(x) * 4, 30)]) <- TRUE # introduce some missing values
mbst <- xgboost(data = x, label = as.numeric(iris$Species) - 1, nrounds = nrounds,
                max_depth = 2, eta = 0.3, subsample = .5, nthread = 2,
                objective = "multi:softprob", num_class = nclass, verbose = 0)
trees0 <- seq(from=0, by=nclass, length.out=nrounds)
col <- rgb(0, 0, 1, 0.5)
xgb.plot.shap(x, model = mbst, trees = trees0, target_class = 0, top_n = 4,
              n_col = 2, col = col, pch = 16, pch_NA = 17)
xgb.plot.shap(x, model = mbst, trees = trees0 + 1, target_class = 1, top_n = 4,
              n_col = 2, col = col, pch = 16, pch_NA = 17)
xgb.plot.shap(x, model = mbst, trees = trees0 + 2, target_class = 2, top_n = 4,
              n_col = 2, col = col, pch = 16, pch_NA = 17)




