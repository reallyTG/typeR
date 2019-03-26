library(XML)


### Name: docName
### Title: Accessors for name of XML document
### Aliases: docName docName,XMLDocument-method
###   docName,XMLDocumentContent-method docName,XMLHashTree-method
###   docName,XMLInternalDocument-method docName,XMLInternalNode-method
###   docName,XMLHashTreeNode-method docName,NULL-method
###   docName,XMLNode-method docName<- docName<-,XMLInternalDocument-method
###   docName<-,XMLHashTree-method
### Keywords: IO programming

### ** Examples

  f = system.file("exampleData", "catalog.xml",  package = "XML")
  doc = xmlInternalTreeParse(f)
  docName(doc)

  doc = xmlInternalTreeParse("<a><b/></a>", asText = TRUE)
      # an NA
  docName(doc)
  docName(doc) = "Simple XML example"
  docName(doc)



