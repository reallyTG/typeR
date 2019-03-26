library(datapack)


### Name: updateMetadata
### Title: Update selected elements of the XML content of a DataObject in a
###   DataPackage (aka package member).
### Aliases: updateMetadata updateMetadata,DataPackage-method

### ** Examples

# Create a DataObject and add it to the DataPackage
dp <- new("DataPackage")
sampleMeta <- system.file("./extdata/sample-eml.xml", package="datapack")
id <- "1234"
metaObj <- new("DataObject", id="1234", format="eml://ecoinformatics.org/eml-2.1.1", 
                file=sampleMeta)
dp <- addMember(dp, metaObj)

# In the metadata object, insert the newly assigned data 
xp <- sprintf("//dataTable/physical/distribution[../objectName/text()=\"%s\"]/online/url", 
              "sample-data.csv") 
newURL <- sprintf("https://cn.dataone.org/cn/v2/resolve/%s", "1234")
dp <- updateMetadata(dp, id, xpath=xp, replacement=newURL)



