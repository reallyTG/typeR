library(XML)


### Name: length.XMLNode
### Title: Determine the number of children in an XMLNode object.
### Aliases: length.XMLNode
### Keywords: file

### ** Examples

  doc <- xmlTreeParse(system.file("exampleData", "mtcars.xml", package="XML"))
  r <- xmlRoot(doc, skip=TRUE)
  length(r)
    # get the last entry
  r[[length(r)]]



