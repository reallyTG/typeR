library(datapack)


### Name: serializeSystemMetadata
### Title: Serialize a SystemMetadata object to an XML representation
### Aliases: serializeSystemMetadata
###   serializeSystemMetadata,SystemMetadata-method

### ** Examples

library(XML)
doc <- xmlParseDoc(system.file("testfiles/sysmeta.xml", package="datapack"), asText=FALSE)
sysmeta <- new("SystemMetadata")
sysmeta <- parseSystemMetadata(sysmeta, xmlRoot(doc))
sysmetaXML <- serializeSystemMetadata(sysmeta, version="v2")



