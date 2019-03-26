library(datapack)


### Name: setPublicAccess
### Title: Add a Rule to the AccessPolicy to make the object publicly
###   readable.
### Aliases: setPublicAccess setPublicAccess,DataObject-method
###   setPublicAccess setPublicAccess,DataPackage-method setPublicAccess

### ** Examples

data <- charToRaw("1,2,3\n4,5,6\n")
do <- new("DataObject", "id1", dataobj=data, "text/csv", 
  "uid=jones,DC=example,DC=com", "urn:node:KNB")
do <- setPublicAccess(do)
# First create a sample package with two DataObjects
dp <- new("DataPackage")
data <- charToRaw("1,2,3\n4,5,6\n")
obj <- new("DataObject", id="id1", dataobj=data, format="text/csv")
dp <- addMember(dp, obj)
data2 <- charToRaw("7,8,9\n4,10,11\n")
obj2 <- new("DataObject", id="id2", dataobj=data2, format="text/csv")
dp <- addMember(dp, obj2)
# Now add public read to all package members ("id1", "id2")
dp <- setPublicAccess(dp)



