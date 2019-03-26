library(xgboost)


### Name: xgb.Booster.complete
### Title: Restore missing parts of an incomplete xgb.Booster object.
### Aliases: xgb.Booster.complete

### ** Examples


data(agaricus.train, package='xgboost')
bst <- xgboost(data = agaricus.train$data, label = agaricus.train$label, max_depth = 2,
               eta = 1, nthread = 2, nrounds = 2, objective = "binary:logistic")
saveRDS(bst, "xgb.model.rds")

bst1 <- readRDS("xgb.model.rds")
# the handle is invalid:
print(bst1$handle)

bst1 <- xgb.Booster.complete(bst1)
# now the handle points to a valid internal booster model:
print(bst1$handle)




