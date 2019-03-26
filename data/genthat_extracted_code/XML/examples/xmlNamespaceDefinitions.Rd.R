library(XML)


### Name: xmlNamespaceDefinitions
### Title: Get definitions of any namespaces defined in this XML node
### Aliases: xmlNamespaceDefinitions getDefaultNamespace xmlNamespaces
###   xmlNamespaces<- xmlNamespaces<-,XMLInternalNode-method
###   xmlNamespaces<-,XMLNode-method
###   coerce,NULL,XMLNamespaceDefinitions-method
###   coerce,XMLNamespace,character-method
###   coerce,XMLNamespaceDefinition,character-method
###   coerce,XMLNamespaceDefinitions,character-method
###   coerce,character,XMLNamespaceDefinitions-method
### Keywords: IO

### ** Examples

  f = system.file("exampleData", "longitudinalData.xml", package = "XML")
  n = xmlRoot(xmlTreeParse(f))
  xmlNamespaceDefinitions(n)
  xmlNamespaceDefinitions(n, recursive = TRUE)


    # Now using internal nodes.
  f = system.file("exampleData", "namespaces.xml", package = "XML")
  doc = xmlInternalTreeParse(f)
  n = xmlRoot(doc)
  xmlNamespaceDefinitions(n)

  xmlNamespaceDefinitions(n, recursive = TRUE)



