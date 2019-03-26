library(xgboost)


### Name: print.xgb.DMatrix
### Title: Print xgb.DMatrix
### Aliases: print.xgb.DMatrix

### ** Examples

data(agaricus.train, package='xgboost')
train <- agaricus.train
dtrain <- xgb.DMatrix(train$data, label=train$label)

dtrain
print(dtrain, verbose=TRUE)




