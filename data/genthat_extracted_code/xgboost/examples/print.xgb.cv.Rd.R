library(xgboost)


### Name: print.xgb.cv.synchronous
### Title: Print xgb.cv result
### Aliases: print.xgb.cv.synchronous

### ** Examples

data(agaricus.train, package='xgboost')
train <- agaricus.train
cv <- xgb.cv(data = train$data, label = train$label, nfold = 5, max_depth = 2,
               eta = 1, nthread = 2, nrounds = 2, objective = "binary:logistic")
print(cv)
print(cv, verbose=TRUE)




