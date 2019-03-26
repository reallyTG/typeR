library(dataone)


### Name: getObject
### Title: Get the bytes associated with an object on this Node.
### Aliases: getObject getObject,CNode-method getObject,MNode-method

### ** Examples

## Not run: 
##D library(dataone)
##D cn <- CNode()
##D mn <- getMNode(cn, "urn:node:KNB")
##D pid <- "solson.5.1"
##D obj <- getObject(mn, pid)
##D df <- read.csv(text=rawToChar(obj))
## End(Not run)



