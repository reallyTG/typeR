library(xgboost)


### Name: xgb.model.dt.tree
### Title: Parse a boosted tree model text dump
### Aliases: xgb.model.dt.tree

### ** Examples

# Basic use:

data(agaricus.train, package='xgboost')

bst <- xgboost(data = agaricus.train$data, label = agaricus.train$label, max_depth = 2, 
               eta = 1, nthread = 2, nrounds = 2,objective = "binary:logistic")

(dt <- xgb.model.dt.tree(colnames(agaricus.train$data), bst))

# This bst model already has feature_names stored with it, so those would be used when 
# feature_names is not set:
(dt <- xgb.model.dt.tree(model = bst))

# How to match feature names of splits that are following a current 'Yes' branch:

merge(dt, dt[, .(ID, Y.Feature=Feature)], by.x='Yes', by.y='ID', all.x=TRUE)[order(Tree,Node)]
 



