library(liquidSVM)


### Name: mcSVM
### Title: Multiclass Classification
### Aliases: mcSVM svmMulticlass

### ** Examples

## Not run: 
##D model <- mcSVM(Species ~ ., iris)
##D model <- mcSVM(Species ~ ., iris, mc_type="OvA")
##D model <- mcSVM(Species ~ ., iris, mc.type="AvA_hi")
##D model <- mcSVM(Species ~ ., iris, predict.prob=TRUE)
##D 
##D ## a worked example can be seen at
##D 
##D vignette("demo",package="liquidSVM")
## End(Not run)




