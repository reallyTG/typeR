library(datapack)


### Name: replaceMember
### Title: Replace the raw data or file associated with a DataObject
### Aliases: replaceMember replaceMember,DataPackage-method

### ** Examples

# Create a DataObject and add it to the DataPackage
dp <- new("DataPackage")
doIn <- new("DataObject", format="text/csv", 
            filename=system.file("./extdata/pkg-example/binary.csv", package="datapack"))
dp <- addMember(dp, doIn)

# Use the zipped version of the file instead by updating the DataObject
dp <- replaceMember(dp, doIn, 
          replacement=system.file("./extdata/pkg-example/binary.csv.zip", 
          package="datapack"),
                    formatId="application/zip")



