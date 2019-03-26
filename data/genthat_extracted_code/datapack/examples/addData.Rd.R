library(datapack)


### Name: addData
### Title: Add a DataObject to the DataPackage
### Aliases: addData addData,DataPackage,DataObject-method

### ** Examples

dpkg <- new("DataPackage")
data <- charToRaw("1,2,3\n4,5,6")
metadata <- charToRaw("EML or other metadata document text goes here\n")
md <- new("DataObject", id="md1", dataobj=metadata, format="text/xml", user="smith", 
  mnNodeId="urn:node:KNB")
do <- new("DataObject", id="id1", dataobj=data, format="text/csv", user="smith", 
  mnNodeId="urn:node:KNB")
# Associate the metadata object with the science object. The 'mo' object will be added 
# to the package  automatically, since it hasn't been added yet.
# This method is now deprecated, so suppress warnings if desired. 
suppressWarnings(dpkg <- addData(dpkg, do, md))



