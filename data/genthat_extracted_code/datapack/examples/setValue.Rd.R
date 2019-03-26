library(datapack)


### Name: setValue
### Title: Set values for selected DataPackage members.
### Aliases: setValue setValue,DataPackage-method

### ** Examples

# First create a package that we can modify. 
dp <- new("DataPackage")
data <- charToRaw("1,2,3\n4,5,6")
# The next statment sets the format type incorrectly as an example, so we can correct it later
do <- new("DataObject", id="myNewId", dataobj=data, format="image/jpg", user="jsmith")
dp <- addMember(dp, do)
data <- charToRaw("7,8.9\n4,10,11")
# This next statement also sets the format type incorrectly
do <- new("DataObject", id="myNewId2", dataobj=data, format="image/jpg", user="jsmith")
dp <- addMember(dp, do)
# Change format types to correct value for both package members
# Careful! Specifying 'identifiers=getIdentifiers(dp) will update all package members!
dp <- setValue(dp, name="sysmeta@formatId", value="text/csv", identifiers=getIdentifiers(dp))



