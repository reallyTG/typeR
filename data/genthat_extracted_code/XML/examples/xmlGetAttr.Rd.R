library(XML)


### Name: xmlGetAttr
### Title: Get the value of an attribute in an XML node
### Aliases: xmlGetAttr
### Keywords: file

### ** Examples

 node <- xmlNode("foo", attrs=c(a="1", b="my name"))

 xmlGetAttr(node, "a")
 xmlGetAttr(node, "doesn't exist", "My own default value")

 xmlGetAttr(node, "b", "Just in case")



