library(datapack)


### Name: getData
### Title: Get the data content of a specified data object
### Aliases: getData getData,DataObject-method getData
###   getData,DataPackage-method

### ** Examples

data <- charToRaw("1,2,3\n4,5,6\n")
do <- new("DataObject", "id1", dataobj=data, "text/csv", 
  "uid=jones,DC=example,DC=com", "urn:node:KNB")
bytes <- getData(do)
dp <- new("DataPackage")
data <- charToRaw("1,2,3\n4,5,6")
do1 <- new("DataObject", id="id1", data, format="text/csv", user="smith", mnNodeId="urn:node:KNB")
dp <- addMember(dp, do1)
bytes <- getData(dp, "id1")



