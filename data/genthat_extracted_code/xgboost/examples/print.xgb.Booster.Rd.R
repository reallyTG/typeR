library(xgboost)


### Name: print.xgb.Booster
### Title: Print xgb.Booster
### Aliases: print.xgb.Booster

### ** Examples

data(agaricus.train, package='xgboost')
train <- agaricus.train
bst <- xgboost(data = train$data, label = train$label, max_depth = 2,
               eta = 1, nthread = 2, nrounds = 2, objective = "binary:logistic")
attr(bst, 'myattr') <- 'memo'

print(bst)
print(bst, verbose=TRUE)




