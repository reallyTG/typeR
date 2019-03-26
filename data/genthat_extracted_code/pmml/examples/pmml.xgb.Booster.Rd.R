library(pmml)


### Name: pmml.xgb.Booster
### Title: Generate PMML for a xgb.Booster object from the xgboost package
### Aliases: pmml.xgb.Booster

### ** Examples

# Standard example using the xgboost package example model
# make the xgboost model using xgb.DMatrix object as inputs
## Not run: 
##D library(xgboost)
##D data(agaricus.train, package='xgboost')
##D data(agaricus.test, package='xgboost')
##D train <- agaricus.train
##D test <- agaricus.test
##D model1 <- xgboost(data = train$data, label = train$label, max_depth = 2,eta = 1, nthread = 2, 
##D                   nrounds = 2, objective = "binary:logistic")
## End(Not run)

# the input feature names for the xgb.DMatrix object can be extracted as colnames(train$data)
# the output field name and categories must be inferred. Looking at train$label informs us 
# that the output categories are either 0 or 1. The name cannot be inferred and so will be 
# given a name "prediction1" save the tree information required in an external file
## Not run: 
##D xgb.dump(model1, "model1.dumped.trees")
## End(Not run)
# Now all requiredinput parameters are known:
## Not run: 
##D pmml(model1,inputFeatureNames=colnames(train$data),outputLabelName="prediction1",
##D  outputCategories=c("0","1"),xgbDumpFile="model1.dumped.trees")
## End(Not run)

# use iris dataset to make a multinomial model
# input data as a matrix
## Not run: 
##D model2 <- xgboost(data = as.matrix(iris[,1:4]), label = as.numeric(iris[,5])-1, 
##D                max_depth = 2, eta = 1, nthread = 2, nrounds = 2, objective = "multi:softprob",
##D                num_class=3)
## End(Not run)
               
# The field names are easily extracted from the columnnames and the categories are converted to
# numeric format by xgboost.
# save the tree information file
## Not run: 
##D xgb.dump(model2, "model2.dumped.trees")
##D 
##D pmml(model2,inputFeatureNames=colnames(as.matrix(iris[,1:4])),outputLabelName="Species",
##D outputCategories=c(1,2,3),xgbDumpFile="model2.dumped.trees")
## End(Not run)




