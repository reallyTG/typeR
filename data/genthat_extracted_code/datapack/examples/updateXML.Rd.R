library(datapack)


### Name: updateXML
### Title: Update selected elements of the XML content of a DataObject
### Aliases: updateXML updateXML,DataObject-method

### ** Examples

## Not run: 
##D library(datapack)
##D dataObj <- new("DataObject", format="text/csv", file=sampleData)
##D sampleEML <- system.file("extdata/sample-eml.xml", package="datapack")
##D dataObj <- updateMetadata(dataObj, xpath="", replacement=)
## End(Not run)
library(datapack)
# Create the metadata object with a sample EML file
sampleMeta <- system.file("./extdata/sample-eml.xml", package="datapack")
metaObj <- new("DataObject", format="eml://ecoinformatics.org/eml-2.1.1", file=sampleMeta)
# In the metadata object, replace "sample-data.csv" with 'sample-data.csv.zip'
xp <- sprintf("//dataTable/physical/objectName[text()=\"%s\"]", "sample-data.csv")
metaObj <- updateXML(metaObj, xpath=xp, replacement="sample-data.csv.zip")



