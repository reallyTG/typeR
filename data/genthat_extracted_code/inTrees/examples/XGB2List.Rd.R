library(inTrees)


### Name: XGB2List
### Title: Transform an xgboost object to a list of trees
### Aliases: XGB2List
### Keywords: xgboost

### ** Examples

	library(data.table)
	library(xgboost)
	# test data set 1: iris
	X <- within(iris,rm("Species")); Y <- iris[,"Species"]
	X <- within(iris,rm("Species")); Y <- iris[,"Species"]
	model_mat <- model.matrix(~. -1, data=X)
	xgb <- xgboost(model_mat, label = as.numeric(Y) - 1, nrounds = 20, 
		objective = "multi:softprob", num_class = 3 )
	tree_list <- XGB2List(xgb,model_mat)



