library(datapack)


### Name: getFormatId
### Title: Get the FormatId of the DataObject
### Aliases: getFormatId getFormatId,DataObject-method getFormatId

### ** Examples

data <- charToRaw("1,2,3\n4,5,6\n")
do <- new("DataObject", "id1", dataobj=data, "text/csv", 
  "uid=jones,DC=example,DC=com", "urn:node:KNB")
fmtId <- getFormatId(do)



