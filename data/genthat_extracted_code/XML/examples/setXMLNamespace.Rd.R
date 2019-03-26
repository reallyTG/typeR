library(XML)


### Name: setXMLNamespace
### Title: Set the name space on a node
### Aliases: setXMLNamespace
### Keywords: programming

### ** Examples

  # define a new namespace
 e = newXMLNode("foo")
 setXMLNamespace(e, c("r" = "http://www.r-project.org"))

  # use an existing namespace on an ancestor node
 e = newXMLNode("top", namespaceDefinitions = c("r" = "http://www.r-project.org"))
 setXMLNamespace(e, "r")
 e

 



