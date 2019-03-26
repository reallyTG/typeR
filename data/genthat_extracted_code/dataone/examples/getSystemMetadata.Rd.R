library(dataone)


### Name: getSystemMetadata
### Title: Get the metadata describing system properties associated with an
###   object on this Node.
### Aliases: getSystemMetadata getSystemMetadata,CNode-method
###   getSystemMetadata,MNode-method

### ** Examples

## Not run: 
##D  
##D library(dataone)
##D cn <- CNode()
##D mn <- getMNode(cn, "urn:node:KNB")
##D pid <- "doi:10.5063/F1QN64NZ"
##D sysmeta <- getSystemMetadata(mn, pid)
## End(Not run)
## Not run: 
##D library(dataone)
##D cn <- CNode()
##D pid <- "aceasdata.3.2"
##D sysmeta <- getSystemMetadata(cn, pid)
## End(Not run)



