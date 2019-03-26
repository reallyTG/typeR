library(dataone)


### Name: archive
### Title: Archive an object on a Member Node or Coordinating Node, which
###   hides it from casual searches.
### Aliases: archive archive,D1Node-method

### ** Examples

## Not run: 
##D library(dataone)
##D library(uuid)
##D library(digest)
##D library(datapack)
##D # First create a new object
##D cn <- CNode("STAGING")
##D mn <- getMNode(cn, "urn:node:mnStageUCSB2")
##D testdf <- data.frame(x=1:10,y=11:20)
##D csvfile <- paste(tempfile(), ".csv", sep="")
##D write.csv(testdf, csvfile, row.names=FALSE)
##D \dontrun{
##D newid <- generateIdentifier(mn, "UUID")
##D }
##D # Create an identifier manually
##D newid <- paste("urn:uuid:", UUIDgenerate(), sep="") 
##D format <- "text/csv"
##D size <- file.info(csvfile)$size
##D sha1 <- digest(csvfile, algo="sha1", serialize=FALSE, file=TRUE)
##D sysmeta <- new("SystemMetadata", identifier=newid, formatId=format, size=size, checksum=sha1)
##D sysmeta <- addAccessRule(sysmeta, "public", "read")
##D # Create (upload) the object to DataONE (requires authentication)
##D \dontrun{
##D create(mn, newid, csvfile, sysmeta)
##D # Now for demonstration purposes, archive the object
##D # Archive the object (requires authentication)
##D archivedId <- archive(mn, newid)
##D }
## End(Not run)



