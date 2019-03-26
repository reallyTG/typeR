library(datapack)


### Name: getMember
### Title: Return the Package Member by Identifier
### Aliases: getMember getMember,DataPackage-method

### ** Examples

dp <- new("DataPackage")
data <- charToRaw("1,2,3\n4,5,6")
do <- new("DataObject", id="myNewId", dataobj=data, format="text/csv", user="jsmith")
dp <- addMember(dp, do)
do2 <- getMember(dp, "myNewId")



