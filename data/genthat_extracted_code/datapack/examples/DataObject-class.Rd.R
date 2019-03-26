library(datapack)


### Name: DataObject-class
### Title: DataObject wraps raw data with system-level metadata
### Aliases: DataObject-class
### Keywords: classes

### ** Examples

data <- charToRaw("1,2,3\n4,5,6\n")
do <- new("DataObject", "id1", dataobj=data, "text/csv", 
  "uid=jones,DC=example,DC=com", "urn:node:KNB")
getIdentifier(do)
getFormatId(do)
getData(do)
canRead(do, "uid=anybody,DC=example,DC=com")
do <- setPublicAccess(do)
canRead(do, "public")
canRead(do, "uid=anybody,DC=example,DC=com")
# Also can create using a file for storage, rather than memory
## Not run: 
##D tf <- tempfile()
##D con <- file(tf, "wb")
##D writeBin(data, con)
##D close(con)
##D do <- new("DataObject", "id1", format="text/csv", user="uid=jones,DC=example,DC=com", 
##D   mnNodeId="urn:node:KNB", filename=tf)
## End(Not run)



