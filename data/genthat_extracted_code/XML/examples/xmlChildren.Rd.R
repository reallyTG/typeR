library(XML)


### Name: xmlChildren
### Title: Gets the sub-nodes within an XMLNode object.
### Aliases: xmlChildren xmlChildren<- xmlChildren.XMLNode
###   xmlChildren.XMLInternalNode xmlChildren.XMLInternalDocument
###   xmlChildren<-,XMLInternalNode-method xmlChildren<-,ANY-method
### Keywords: file

### ** Examples

  fileName <- system.file("exampleData", "mtcars.xml", package="XML")
  doc <- xmlTreeParse(fileName)
  names(xmlChildren(doc$doc$children[["dataset"]]))



