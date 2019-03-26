library(dataone)


### Name: reserveIdentifier
### Title: Reserve a identifier that is unique in the DataONE network.
### Aliases: reserveIdentifier reserveIdentifier,CNode-method
###   reserveIdentifier,D1Client-method

### ** Examples

## Not run: 
##D library(dataone)
##D library(uuid)
##D cn <- CNode("STAGING")
##D myId <- sprintf("urn:uuid:%s", UUIDgenerate())
##D newId <- reserveIdentifier(cn, myId)
## End(Not run)



