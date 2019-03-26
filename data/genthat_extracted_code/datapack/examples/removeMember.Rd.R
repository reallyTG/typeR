library(datapack)


### Name: removeMember
### Title: Remove the Specified Member from the Package
### Aliases: removeMember removeMember,DataPackage-method

### ** Examples

dp <- new("DataPackage")
data <- charToRaw("1,2,3\n4,5,6")
do <- new("DataObject", id="myNewId", dataobj=data, format="text/csv", user="jsmith")
dp <- addMember(dp, do)
# Remove the package member and any provenance relationships that reference it.
removeMember(dp, "myNewId", removeRelationships=TRUE)



