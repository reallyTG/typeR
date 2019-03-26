library(xgboost)


### Name: xgb.DMatrix
### Title: Construct xgb.DMatrix object
### Aliases: xgb.DMatrix

### ** Examples

data(agaricus.train, package='xgboost')
train <- agaricus.train
dtrain <- xgb.DMatrix(train$data, label=train$label)
xgb.DMatrix.save(dtrain, 'xgb.DMatrix.data')
dtrain <- xgb.DMatrix('xgb.DMatrix.data')



