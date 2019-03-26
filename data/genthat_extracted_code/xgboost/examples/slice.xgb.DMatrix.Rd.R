library(xgboost)


### Name: slice
### Title: Get a new DMatrix containing the specified rows of orginal
###   xgb.DMatrix object
### Aliases: slice slice.xgb.DMatrix [.xgb.DMatrix

### ** Examples

data(agaricus.train, package='xgboost')
train <- agaricus.train
dtrain <- xgb.DMatrix(train$data, label=train$label)

dsub <- slice(dtrain, 1:42)
labels1 <- getinfo(dsub, 'label')
dsub <- dtrain[1:42, ]
labels2 <- getinfo(dsub, 'label')
all.equal(labels1, labels2)




