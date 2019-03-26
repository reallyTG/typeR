library(dataone)


### Name: isAuthorized
### Title: Check if an action is authorized for the specified identifier
### Aliases: isAuthorized isAuthorized,D1Node-method

### ** Examples

## Not run: 
##D # Send an authorization check to the D1 production CN.
##D cn <- CNode("PROD")
##D pid <- "doi:10.6073/pasta/7fcb8fea57843fae65f63094472f502d"
##D canRead <- isAuthorized(cn, pid, "read")
##D canWrite <- isAuthorized(cn, pid, "write")
##D canChange <- isAuthorized(cn, pid, "changePermission")
##D 
##D # Now send a check to a member node.
##D mn <- getMNode(cn, "urn:node:KNB")
##D pid <- "doi:10.6085/AA/pisco_recruitment.149.1"
##D canRead <- isAuthorized(mn, pid, "read")
##D canWrite <- isAuthorized(mn, pid, "write")
##D canChange <- isAuthorized(mn, pid, "changePermission")
## End(Not run)



