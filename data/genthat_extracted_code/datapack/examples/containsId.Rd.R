library(datapack)


### Name: containsId
### Title: Returns true if the specified object is a member of the package
### Aliases: containsId containsId,DataPackage-method

### ** Examples

dp <- new("DataPackage")
data <- charToRaw("1,2,3\n4,5,6")
id <- "myNewId"
do <- new("DataObject", id=id, dataobj=data, format="text/csv", user="jsmith")
dp <- addMember(dp, do)
isInPackage <- containsId(dp, identifier="myNewId")



