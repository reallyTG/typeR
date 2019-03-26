library(dataone)


### Name: encodeUrlPath
### Title: Encode the Input for a URL Path Segment.
### Aliases: encodeUrlPath encodeUrlPath,D1Client-method

### ** Examples

## Not run: 
##D d1c <- D1Client("STAGING", "urn:node:mnStageUCSB2")
##D fullyEncodedPath <- paste0("cn/v1/object/", 
##D     encodeUrlPath(d1c, "doi:10.6085/AA/YBHX00_XXXITBDXMMR01_20040720.50.5"))
## End(Not run)



