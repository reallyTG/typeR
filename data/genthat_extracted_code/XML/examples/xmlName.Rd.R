library(XML)


### Name: xmlName
### Title: Extraces the tag name of an XMLNode object.
### Aliases: xmlName xmlName<- xmlName.XMLComment xmlName.XMLNode
###   xmlName.XMLInternalNode
### Keywords: file

### ** Examples

 fileName <- system.file("exampleData", "test.xml", package="XML") 
 doc <- xmlTreeParse(fileName)
 xmlName(xmlRoot(doc)[[1]])

 tt = xmlRoot(doc)[[1]]
 xmlName(tt)
 xmlName(tt) <- "bob"


  # We can set the node on an internal object also.
 n = newXMLNode("x")

 xmlName(n)
 xmlName(n) <- "y"

 
 xmlName(n) <- "r:y"




