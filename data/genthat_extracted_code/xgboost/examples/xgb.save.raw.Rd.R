library(xgboost)


### Name: xgb.save.raw
### Title: Save xgboost model to R's raw vector, user can call xgb.load to
###   load the model back from raw vector
### Aliases: xgb.save.raw

### ** Examples

data(agaricus.train, package='xgboost')
data(agaricus.test, package='xgboost')
train <- agaricus.train
test <- agaricus.test
bst <- xgboost(data = train$data, label = train$label, max_depth = 2, 
               eta = 1, nthread = 2, nrounds = 2,objective = "binary:logistic")
raw <- xgb.save.raw(bst)
bst <- xgb.load(raw)
pred <- predict(bst, test$data)




