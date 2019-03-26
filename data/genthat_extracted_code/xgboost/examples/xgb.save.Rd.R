library(xgboost)


### Name: xgb.save
### Title: Save xgboost model to binary file
### Aliases: xgb.save

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



