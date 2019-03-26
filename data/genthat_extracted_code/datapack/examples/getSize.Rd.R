library(datapack)


### Name: getSize
### Title: Get the Count of Objects in the Package
### Aliases: getSize getSize,DataPackage-method

### ** Examples

dp <- new("DataPackage")
data <- charToRaw("1,2,3\n4,5,6")
do <- new("DataObject", dataobj=data, format="text/csv", user="jsmith")
dp <- addMember(dp, do)
getSize(dp)



