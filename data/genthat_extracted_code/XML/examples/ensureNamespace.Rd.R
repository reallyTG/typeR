library(XML)


### Name: ensureNamespace
### Title: Ensure that the node has a definition for particular XML
###   namespaces
### Aliases: ensureNamespace
### Keywords: IO

### ** Examples

  doc = newXMLDoc()
  top = newXMLNode("article", doc = doc)
  ensureNamespace(top, c(r = "http://www.r-project.org"))
  b = newXMLNode("r:code", parent = top)
  print(doc)



