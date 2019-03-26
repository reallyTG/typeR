library(datapack)


### Name: validate
### Title: Validate a SystemMetadata object.
### Aliases: validate validate,SystemMetadata-method

### ** Examples

library(XML)
doc <- xmlParseDoc(system.file("testfiles/sysmeta.xml", package="datapack"), asText=FALSE)
sysmeta <- new("SystemMetadata")
sysmeta <- parseSystemMetadata(sysmeta, xmlRoot(doc))
valid <- validate(sysmeta)



