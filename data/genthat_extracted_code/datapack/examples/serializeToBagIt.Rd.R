library(datapack)


### Name: serializeToBagIt
### Title: Serialize A DataPackage into a BagIt Archive File
### Aliases: serializeToBagIt serializeToBagIt,DataPackage-method

### ** Examples

# Create the first data object
dp <- new("DataPackage")
data <- charToRaw("1,2,3\n4,5,6")
do <- new("DataObject", id="do1", dataobj=data, format="text/csv", user="jsmith")
dp <- addMember(dp, do)
# Create a second data object
data2 <- charToRaw("7,8,9\n4,10,11")
do2 <- new("DataObject", id="do2", dataobj=data2, format="text/csv", user="jsmith")
dp <- addMember(dp, do2)
# Create a relationship between the two data objects
dp <- describeWorkflow(dp, sources="do2", derivations="do2")
# Write out the data package to a BagIt file
## Not run: 
##D bagitFile <- serializeToBagIt(dp, syntaxName="json", mimeType="application/json")
## End(Not run)



