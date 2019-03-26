library(geometa)


### Name: ISORangeDimension
### Title: ISORangeDimension
### Aliases: ISORangeDimension
### Keywords: ISO dimension range

### ** Examples

   #create dimension
   md <- ISORangeDimension$new()
   md$setSequenceIdentifier(ISOMemberName$new(aName = "name", attributeType = "type"))
   md$setDescriptor("descriptor")
   xml <- md$encode()
   



