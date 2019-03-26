library(liquidSVM)


### Name: rocSVM
### Title: Receiver Operating Characteristic curve (ROC curve)
### Aliases: rocSVM

### ** Examples

## Not run: 
##D banana <- liquidData('banana-bc')
##D model <- rocSVM(Y ~ ., banana$train, display=1)
##D plotROC(model,banana$test)
##D 
##D ## a worked example can be seen at
##D vignette("demo",package="liquidSVM")
## End(Not run)
 



