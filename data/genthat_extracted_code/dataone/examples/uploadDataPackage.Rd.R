library(dataone)


### Name: uploadDataPackage
### Title: Upload a DataPackage to a DataONE member node.
### Aliases: uploadDataPackage uploadDataPackage,D1Client-method

### ** Examples

## Not run: 
##D library(dataone)
##D library(datapack)
##D dp <- new("DataPackage")
##D sampleData <- system.file("extdata/sample.csv", package="dataone")
##D dataObj <- new("DataObject", format="text/csv", file=sampleData)
##D dataObj <- setPublicAccess(dataObj)
##D sampleEML <- system.file("extdata/strix-pacific-northwest.xml", package="dataone")
##D metadataObj <- new("DataObject", format="eml://ecoinformatics.org/eml-2.1.1", file=sampleEML)
##D metadataObj <- setPublicAccess(metadataObj)
##D dp <- addMember(dp, do = dataObj, mo = metadataObj)
##D d1c <- D1Client("STAGING", "urn:node:mnStageUCSB2")
##D # Upload all members of the DataPackage to DataONE (requires authentication)
##D packageId <- uploadDataPackage(d1c, dp, replicate=TRUE, public=TRUE, numberReplicas=2)
## End(Not run)



