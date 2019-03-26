library(XML)


### Name: xmlCleanNamespaces
### Title: Remove redundant namespaces on an XML document
### Aliases: xmlCleanNamespaces
### Keywords: programming IO

### ** Examples

f = system.file("exampleData", "redundantNS.xml", package = "XML")
doc = xmlParse(f)
print(doc)
newDoc = xmlCleanNamespaces(f, out = FALSE)



