library(datapack)


### Name: parseSystemMetadata
### Title: Parse an external XML document and populate a SystemMetadata
###   object with the parsed data
### Aliases: parseSystemMetadata parseSystemMetadata,SystemMetadata-method

### ** Examples

library(XML)
doc <- xmlParseDoc(system.file("testfiles/sysmeta.xml", package="datapack"), asText=FALSE)
sysmeta <- new("SystemMetadata")
sysmeta <- parseSystemMetadata(sysmeta, xmlRoot(doc))



