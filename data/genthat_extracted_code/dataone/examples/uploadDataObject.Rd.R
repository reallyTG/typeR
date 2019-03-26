library(dataone)


### Name: uploadDataObject
### Title: Upload a DataObject to a DataONE member node.
### Aliases: uploadDataObject uploadDataObject,D1Client-method

### ** Examples

## Not run: 
##D library(dataone)
##D library(datapack)
##D testdf <- data.frame(x=1:10,y=11:20)
##D csvfile <- tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".csv")
##D write.csv(testdf, csvfile, row.names=FALSE)
##D d1c <- D1Client("STAGING", "urn:node:mnStageUCSB2")
##D do <- new("DataObject", format="text/csv", mnNodeId=getMNodeId(d1c), filename=csvfile)
##D # Upload a single DataObject to DataONE (requires authentication)
##D newId <- uploadDataObject(d1c, do, replicate=FALSE, preferredNodes=NA ,  public=TRUE)
## End(Not run)



