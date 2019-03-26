library(dataone)


### Name: createD1Object
### Title: Create the Object in the DataONE System
### Aliases: createD1Object createD1Object,D1Client,D1Object-method

### ** Examples

## Not run: 
##D library(dataone)
##D library(uuid)
##D d1c <- D1Client("STAGING", "urn:node:mnStageUCSB2")
##D data <- readLines(system.file("extdata/strix-pacific-northwest.xml", package="dataone"))
##D dataRaw <- charToRaw(paste(data, collapse="\n"))
##D newid <- sprintf("urn:node:%s", UUIDgenerate())
##D d1o <- new("D1Object", id=newid, data=dataRaw, format="text/plain")
##D d1o <- setPublicAccess(d1o)
##D # Upload the object to DataONE (requires authentication)
##D uploaded <- createD1Object(d1c, d1o)
## End(Not run)



