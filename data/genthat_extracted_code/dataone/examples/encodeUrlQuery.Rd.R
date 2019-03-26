library(dataone)


### Name: encodeUrlQuery
### Title: Encode the Input for a URL Query Segment.
### Aliases: encodeUrlQuery encodeUrlQuery,D1Client-method

### ** Examples

## Not run: 
##D d1c <- D1Client("STAGING", "urn:node:mnStageUCSB2")
##D fullyEncodedQuery <- paste0("q=id:",
##D     encodeUrlQuery(d1c, encodeSolr("doi:10.6085/AA/YBHX00_XXXITBDXMMR01_20040720.50.5")))
## End(Not run)



