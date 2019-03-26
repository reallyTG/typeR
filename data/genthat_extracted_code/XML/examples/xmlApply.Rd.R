library(XML)


### Name: xmlApply
### Title: Applies a function to each of the children of an XMLNode
### Aliases: xmlApply xmlApply.XMLNode xmlApply.XMLDocument
###   xmlApply.XMLDocumentContent xmlSApply xmlSApply.XMLNode
###   xmlSApply.XMLDocument xmlSApply.XMLDocumentContent
### Keywords: file

### ** Examples

 doc <- xmlTreeParse(system.file("exampleData", "mtcars.xml", package="XML"))
 r <- xmlRoot(doc)
 xmlSApply(r[[2]], xmlName)

 xmlApply(r[[2]], xmlAttrs)

 xmlSApply(r[[2]], xmlSize)




