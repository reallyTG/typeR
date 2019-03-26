library(dataone)


### Name: addData,DataPackage,D1Object-method
### Title: Add a D1Object containing a data object to a DataPackage
### Aliases: addData,DataPackage,D1Object-method

### ** Examples

## Not run: 
##D library(dataone)
##D library(datapack)
##D library(uuid)
##D dp <- new("DataPackage")
##D d1c <- D1Client("STAGING", "urn:node:mnStageUCSB2")
##D # Create metadata object that describes science data
##D newId <- sprintf("urn:uuid:%s", UUIDgenerate())
##D csvfile <- system.file("extdata/sample.csv", package="dataone")
##D sciObj <- new("DataObject", id=newId, format="text/csv",filename=csvfile)
##D dp <- addData(dp, do = sciObj)
## End(Not run)



