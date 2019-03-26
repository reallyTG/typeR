library(xgboost)


### Name: setinfo
### Title: Set information of an xgb.DMatrix object
### Aliases: setinfo setinfo.xgb.DMatrix

### ** Examples

data(agaricus.train, package='xgboost')
train <- agaricus.train
dtrain <- xgb.DMatrix(train$data, label=train$label)

labels <- getinfo(dtrain, 'label')
setinfo(dtrain, 'label', 1-labels)
labels2 <- getinfo(dtrain, 'label')
stopifnot(all.equal(labels2, 1-labels))



