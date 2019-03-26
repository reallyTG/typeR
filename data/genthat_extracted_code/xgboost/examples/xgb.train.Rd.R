library(xgboost)


### Name: xgb.train
### Title: eXtreme Gradient Boosting Training
### Aliases: xgb.train xgboost

### ** Examples

data(agaricus.train, package='xgboost')
data(agaricus.test, package='xgboost')

dtrain <- xgb.DMatrix(agaricus.train$data, label = agaricus.train$label)
dtest <- xgb.DMatrix(agaricus.test$data, label = agaricus.test$label)
watchlist <- list(train = dtrain, eval = dtest)

## A simple xgb.train example:
param <- list(max_depth = 2, eta = 1, silent = 1, nthread = 2, 
              objective = "binary:logistic", eval_metric = "auc")
bst <- xgb.train(param, dtrain, nrounds = 2, watchlist)


## An xgb.train example where custom objective and evaluation metric are used:
logregobj <- function(preds, dtrain) {
   labels <- getinfo(dtrain, "label")
   preds <- 1/(1 + exp(-preds))
   grad <- preds - labels
   hess <- preds * (1 - preds)
   return(list(grad = grad, hess = hess))
}
evalerror <- function(preds, dtrain) {
  labels <- getinfo(dtrain, "label")
  err <- as.numeric(sum(labels != (preds > 0)))/length(labels)
  return(list(metric = "error", value = err))
}

# These functions could be used by passing them either:
#  as 'objective' and 'eval_metric' parameters in the params list:
param <- list(max_depth = 2, eta = 1, silent = 1, nthread = 2, 
              objective = logregobj, eval_metric = evalerror)
bst <- xgb.train(param, dtrain, nrounds = 2, watchlist)

#  or through the ... arguments:
param <- list(max_depth = 2, eta = 1, silent = 1, nthread = 2)
bst <- xgb.train(param, dtrain, nrounds = 2, watchlist,
                 objective = logregobj, eval_metric = evalerror)

#  or as dedicated 'obj' and 'feval' parameters of xgb.train:
bst <- xgb.train(param, dtrain, nrounds = 2, watchlist,
                 obj = logregobj, feval = evalerror)


## An xgb.train example of using variable learning rates at each iteration:
param <- list(max_depth = 2, eta = 1, silent = 1, nthread = 2,
              objective = "binary:logistic", eval_metric = "auc")
my_etas <- list(eta = c(0.5, 0.1))
bst <- xgb.train(param, dtrain, nrounds = 2, watchlist,
                 callbacks = list(cb.reset.parameters(my_etas)))

## Early stopping:
bst <- xgb.train(param, dtrain, nrounds = 25, watchlist,
                 early_stopping_rounds = 3)

## An 'xgboost' interface example:
bst <- xgboost(data = agaricus.train$data, label = agaricus.train$label, 
               max_depth = 2, eta = 1, nthread = 2, nrounds = 2, 
               objective = "binary:logistic")
pred <- predict(bst, agaricus.test$data)




