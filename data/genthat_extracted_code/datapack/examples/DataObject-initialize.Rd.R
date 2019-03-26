library(datapack)


### Name: initialize,DataObject-method
### Title: Initialize a DataObject
### Aliases: initialize,DataObject-method DataObject-initialize

### ** Examples

data <- charToRaw("1,2,3\n4,5,6\n")
do <- new("DataObject", "id1", dataobj=data, "text/csv", 
  "uid=jones,DC=example,DC=com", "urn:node:KNB")



