library(dataone)


### Name: getChecksum
### Title: Get the checksum for the data object associated with the
###   specified pid.
### Aliases: getChecksum getChecksum,CNode-method getChecksum,MNode-method

### ** Examples

## Not run: 
##D  
##D library(dataone)
##D cn <- CNode()
##D mn <- getMNode(cn, "urn:node:KNB")
##D pid <- "doi:10.5063/F1QN64NZ"
##D chksum <- getChecksum(mn, pid)
## End(Not run)
## Not run: 
##D pid <- "doi:10.5063/F1QN64NZ"
##D cn <- CNode()
##D pid <- "doi:10.5063/F1QN64NZ"
##D chksum <- getChecksum(cn, pid)
## End(Not run)



