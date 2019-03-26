library(rfml)


### Name: ml.data.frame
### Title: Creates a ml.data.frame object
### Aliases: ml.data.frame

### ** Examples

## Not run: 
##D  library(rfml)
##D  localConn <- ml.connect()
##D  # create a ml.data.frame based on a search
##D  mlIris <- ml.data.frame(localConn, "setosa")
##D  # using search and collection filtering
##D  mlIris <- ml.data.frame(localConn, "setosa", collection = "iris")
##D  # using field filter
##D  mlIris <- ml.data.frame(localConn, fieldFilter = "Species == setosa")
## End(Not run)



