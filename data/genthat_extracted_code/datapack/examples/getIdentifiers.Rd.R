library(datapack)


### Name: getIdentifiers
### Title: Get the Identifiers of Package Members
### Aliases: getIdentifiers getIdentifiers,DataPackage-method

### ** Examples

dp <- new("DataPackage")
data <- charToRaw("1,2,3\n4,5,6")
do <- new("DataObject", dataobj=data, format="text/csv", user="jsmith")
dp <- addMember(dp, do)
getIdentifiers(dp)



