library(datapack)


### Name: getValue
### Title: Get values for selected DataPackage members.
### Aliases: getValue getValue,DataPackage-method

### ** Examples

dp <- new("DataPackage")
data <- charToRaw("1,2,3\n4,5,6")
do <- new("DataObject", id="myNewId", dataobj=data, format="text/csv", user="jsmith")
dp <- addMember(dp, do)
data <- charToRaw("7,8.9\n4,10,11")
do <- new("DataObject", id="myNewId2", dataobj=data, format="text/csv", user="jsmith")
dp <- addMember(dp, do)
formats <- getValue(dp, name="sysmeta@formatId")



