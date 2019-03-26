library(rfml)


### Name: as.data.frame,ml.data.frame-method
### Title: Pull data from MarkLogic server based on a ml.data.frame object
###   and return it as a data.frame.
### Aliases: as.data.frame as.data.frame,ml.data.frame-method

### ** Examples

## Not run: 
##D  library(rfml)
##D  localConn <- ml.connect()
##D  # create a ml.data.frame based on a search
##D  mlIris <- ml.data.frame(localConn, "setosa")
##D  lIris <- as.data.frame(mlIris)
##D  
## End(Not run)



