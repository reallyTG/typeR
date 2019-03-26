library(xgboost)


### Name: dimnames.xgb.DMatrix
### Title: Handling of column names of 'xgb.DMatrix'
### Aliases: dimnames.xgb.DMatrix dimnames<-.xgb.DMatrix

### ** Examples

data(agaricus.train, package='xgboost')
train <- agaricus.train
dtrain <- xgb.DMatrix(train$data, label=train$label)
dimnames(dtrain)
colnames(dtrain)
colnames(dtrain) <- make.names(1:ncol(train$data))
print(dtrain, verbose=TRUE)




