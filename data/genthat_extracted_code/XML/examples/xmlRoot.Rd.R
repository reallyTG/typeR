library(XML)


### Name: xmlRoot
### Title: Get the top-level XML node.
### Aliases: xmlRoot xmlRoot.XMLDocument xmlRoot.XMLInternalDocument
###   xmlRoot.XMLInternalDOM xmlRoot.XMLDocumentRoot
###   xmlRoot.XMLDocumentContent xmlRoot.HTMLDocument
### Keywords: file

### ** Examples

  doc <- xmlTreeParse(system.file("exampleData", "mtcars.xml", package="XML"))
  xmlRoot(doc)
   # Note that we cannot use getSibling () on a regular R-level XMLNode object
   # since we cannot go back up or across the tree from that node, but
   # only down to the children.

    # Using an internal node via xmlParse (== xmlInternalTreeParse())
  doc <- xmlParse(system.file("exampleData", "mtcars.xml", package="XML"))
  n = xmlRoot(doc, skip = FALSE)
     # skip over the DTD and the comment
  d = getSibling(getSibling(n))



