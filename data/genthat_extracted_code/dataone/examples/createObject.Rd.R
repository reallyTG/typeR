library(dataone)


### Name: createObject
### Title: Create an object on a Member Node.
### Aliases: createObject createObject,MNode-method

### ** Examples

## Not run: 
##D # Create an object in the DataONE "STAGING" environment
##D library(dataone)
##D library(uuid)
##D library(digest)
##D library(datapack)
##D cn <- CNode("STAGING")
##D mn <- getMNode(cn, "urn:node:mnStageUCSB2")
##D # Have Dataone create an identifier for you (requires authentication)
##D \dontrun{
##D newid <- generateIdentifier(mn, "UUID")
##D }
##D # Create an identifier manually
##D newid <- paste("urn:uuid:", UUIDgenerate(), sep="") 
##D testdf <- data.frame(x=1:10,y=11:20)
##D csvfile <- paste(tempfile(), ".csv", sep="")
##D write.csv(testdf, csvfile, row.names=FALSE)
##D format <- "text/csv"
##D size <- file.info(csvfile)$size
##D sha1 <- digest(csvfile, algo="sha1", serialize=FALSE, file=TRUE)
##D sysmeta <- new("SystemMetadata", identifier=newid, formatId=format, size=size, checksum=sha1)
##D sysmeta <- addAccessRule(sysmeta, "public", "read")
##D # Upload the data to DataONE (requires authentication)
##D \dontrun{
##D createObject(mn, newid, csvfile, sysmeta)
##D }
## End(Not run)



