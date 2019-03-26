library(XML)


### Name: xmlSize
### Title: The number of sub-elements within an XML node.
### Aliases: xmlSize xmlSize.default xmlSize.XMLDocument xmlSize.XMLNode
### Keywords: file

### ** Examples

  fileName <- system.file("exampleData", "mtcars.xml", package="XML") 
  doc <- xmlTreeParse(fileName)
  xmlSize(doc)
  xmlSize(doc$doc$children[["dataset"]][["variables"]])



