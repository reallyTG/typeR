library(XML)


### Name: names.XMLNode
### Title: Get the names of an XML nodes children.
### Aliases: names.XMLNode
### Keywords: file

### ** Examples

 doc <- xmlTreeParse(system.file("exampleData", "mtcars.xml", package="XML"))
 names(xmlRoot(doc))

 r <- xmlRoot(doc)
 r[names(r) == "variables"]



