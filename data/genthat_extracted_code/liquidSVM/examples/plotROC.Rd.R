library(liquidSVM)


### Name: plotROC
### Title: Plots the ROC curve for a result or model
### Aliases: plotROC

### ** Examples

## Not run: 
##D banana <- liquidData('banana-bc')
##D model <- rocSVM(Y~.,banana$train)
##D 
##D plotROC(model ,banana$test)
##D # or:
##D result <- test(model, banana$test)
##D plotROC(result, banana$test$Y)
##D 
##D model.ls <- lsSVM(Y~., banana$train)
##D result <- plotROC(model.ls, banana$test)
## End(Not run)



