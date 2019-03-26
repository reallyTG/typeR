library(XML)


### Name: xmlNamespace
### Title: Retrieve the namespace value of an XML node.
### Aliases: xmlNamespace xmlNamespace.XMLNode xmlNamespace.XMLInternalNode
###   xmlNamespace.character XMLNamespace-class xmlNamespace<-
###   xmlNamespace<-,XMLInternalNode-method
### Keywords: file

### ** Examples

  doc <- xmlTreeParse(system.file("exampleData", "job.xml", package="XML"))
  xmlNamespace(xmlRoot(doc))
  xmlNamespace(xmlRoot(doc)[[1]][[1]])


  doc <- xmlInternalTreeParse(system.file("exampleData", "job.xml", package="XML"))
     # Since the first node, xmlRoot() will skip that, by default.
  xmlNamespace(xmlRoot(doc))
  xmlNamespace(xmlRoot(doc)[[1]][[1]])

  node <- xmlNode("arg", xmlNode("name", "foo"), namespace="R")
  xmlNamespace(node)


   doc = xmlParse('<top xmlns:r="http://www.r-project.org"><bob><code>a = 1:10</code></bob></top>')
   node = xmlRoot(doc)[[1]][[1]]
   xmlNamespace(node) = "r"
   node


   doc = xmlParse('<top xmlns:r="http://www.r-project.org"><bob><code>a = 1:10</code></bob></top>')
   node = xmlRoot(doc)[[1]][[1]]
   xmlNamespaces(node, set = TRUE) = c(omg = "http://www.omegahat.net")
   node



