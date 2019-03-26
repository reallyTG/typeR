library(datapack)


### Name: getIdentifier
### Title: Get the Identifier of the DataObject
### Aliases: getIdentifier getIdentifier,DataObject-method getIdentifier

### ** Examples

data <- charToRaw("1,2,3\n4,5,6\n")
do <- new("DataObject", "id1", dataobj=data, "text/csv", 
  "uid=jones,DC=example,DC=com", "urn:node:KNB")
id <- getIdentifier(do)



