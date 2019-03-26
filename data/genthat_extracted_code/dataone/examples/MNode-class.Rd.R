library(dataone)


### Name: MNode-class
### Title: Provides R API to DataONE Member Node services.
### Aliases: MNode-class

### ** Examples

## Not run: 
##D library(dataone)
##D library(uuid)
##D library(digest)
##D cn <- CNode("STAGING")
##D mn <- getMNode(cn, "urn:node:mnStageUCSB2")
##D mnid <- mn@identifier
##D # Have Dataone create an identifier for you (requires authentication)
##D \dontrun{
##D newid <- generateIdentifier(mn, "UUID")
##D }
##D # Create an identifier manually
##D newid <- paste("urn:uuid:", UUIDgenerate(), sep="")
##D testdf <- data.frame(x=1:10,y=11:20)
##D csvfile <- paste(tempfile(), ".csv", sep="")
##D write.csv(testdf, csvfile, row.names=FALSE)
##D f <- "text/csv"
##D size <- file.info(csvfile)$size
##D sha1 <- digest(csvfile, algo="sha1", serialize=FALSE, file=TRUE)
##D sysmeta <- new("SystemMetadata", identifier=newid, formatId=f, size=size,
##D     checksum=sha1, originMemberNode=mnid, authoritativeMemberNode=mnid)
##D # Upload data to DataONE (requires authentication)
##D \dontrun{
##D response <- createObject(mn, newid, csvfile, sysmeta)
##D }
## End(Not run)



