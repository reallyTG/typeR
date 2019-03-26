library(xgboost)


### Name: xgb.load
### Title: Load xgboost model from binary file
### Aliases: xgb.load

### ** Examples

data(agaricus.train, package='xgboost')
data(agaricus.test, package='xgboost')
train <- agaricus.train
test <- agaricus.test
bst <- xgboost(data = train$data, label = train$label, max_depth = 2, 
               eta = 1, nthread = 2, nrounds = 2,objective = "binary:logistic")
xgb.save(bst, 'xgb.model')
bst <- xgb.load('xgb.model')
pred <- predict(bst, test$data)



