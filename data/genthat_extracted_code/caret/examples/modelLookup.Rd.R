library(caret)


### Name: modelLookup
### Title: Tools for Models Available in 'train'
### Aliases: modelLookup getModelInfo checkInstall
### Keywords: utilities

### ** Examples


## Not run: 
##D  
##D modelLookup()
##D modelLookup("gbm")
##D 
##D getModelInfo("pls")
##D getModelInfo("^pls")
##D getModelInfo("pls", regex = FALSE)
##D 
##D checkInstall(getModelInfo("pls")$library)
## End(Not run)




