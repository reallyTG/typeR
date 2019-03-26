library(dataone)


### Name: createDataPackage
### Title: Create a DataPackage on a DataONE Member Node
### Aliases: createDataPackage
###   createDataPackage,D1Client,DataPackage-method

### ** Examples

## Not run: 
##D library(dataone)
##D testdf <- data.frame(x=1:10,y=11:20)
##D csvfile <- tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".csv")
##D write.csv(testdf, csvfile, row.names=FALSE)
##D d1c <- D1Client("STAGING", "urn:node:mnStageUCSB2")
##D dp <- new("DataPackage")
##D emlFile <- system.file("extdata/strix-pacific-northwest.xml", package="dataone")
##D emlChar <- readLines(emlFile)
##D emlRaw <- charToRaw(paste(emlChar, collapse="\n"))
##D emlId <- sprintf("urn:uuid:%s", UUIDgenerate())
##D metadataObj <- new("D1Object", id=emlId, format="eml://ecoinformatics.org/eml-2.1.1", data=emlRaw, 
##D   mnNodeId=getMNodeId(d1c))
##D sdf <- read.csv(csvfile)
##D stf <- charToRaw(convert.csv(d1c, sdf))
##D sciId <- sprintf("urn:uuid:%s", UUIDgenerate())
##D sciObj <- new("D1Object", id=sciId, format="text/csv", data=stf, mnNodeId=getMNodeId(d1c))
##D dp <- addMember(dp, do=sciObj, mo=metadataObj)
##D expect_true(is.element(sciObj@dataObject@sysmeta@identifier, getIdentifiers(dp)))
##D resourceMapId <- createDataPackage(d1c, dp, replicate=TRUE, public=TRUE)
## End(Not run)



