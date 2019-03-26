library(sdm)


### Name: getVarImp
### Title: variable importance
### Aliases: getVarImp getVarImp,sdmModels-method
### Keywords: spatial,data

### ** Examples

## Not run: 
##D # if m is a sdmModels object (output of sdm function) then:
##D 
##D getVarImp(m,id=1,wtest='training') # variable importance based on training dataset
##D 
##D vi <- getVarImp(m,id=1,wtest='test.dep') 
##D 
##D plot(vi,'auc')
##D 
##D plot(vi,'cor')
##D 
## End(Not run)



