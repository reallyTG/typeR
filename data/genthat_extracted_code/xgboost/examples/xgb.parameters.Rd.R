library(xgboost)


### Name: xgb.parameters<-
### Title: Accessors for model parameters.
### Aliases: xgb.parameters<-

### ** Examples

data(agaricus.train, package='xgboost')
train <- agaricus.train

bst <- xgboost(data = train$data, label = train$label, max_depth = 2,
               eta = 1, nthread = 2, nrounds = 2, objective = "binary:logistic")

xgb.parameters(bst) <- list(eta = 0.1)




