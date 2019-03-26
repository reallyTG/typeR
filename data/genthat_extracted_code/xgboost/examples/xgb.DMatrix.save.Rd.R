library(xgboost)


### Name: xgb.DMatrix.save
### Title: Save xgb.DMatrix object to binary file
### Aliases: xgb.DMatrix.save

### ** Examples

data(agaricus.train, package='xgboost')
train <- agaricus.train
dtrain <- xgb.DMatrix(train$data, label=train$label)
xgb.DMatrix.save(dtrain, 'xgb.DMatrix.data')
dtrain <- xgb.DMatrix('xgb.DMatrix.data')



