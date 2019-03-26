library(XML)


### Name: xmlValue
### Title: Extract or set the contents of a leaf XML node
### Aliases: xmlValue xmlValue.XMLCDataNode xmlValue.XMLNode
###   xmlValue.XMLProcessingInstruction xmlValue.XMLTextNode
###   xmlValue.XMLComment xmlValue<- xmlValue<-,XMLAbstractNode-method
###   xmlValue<-,XMLInternalTextNode-method xmlValue<-,XMLTextNode-method
###   coerce,XMLInternalTextNode,character-method
### Keywords: file

### ** Examples

 node <- xmlNode("foo", "Some text")
 xmlValue(node)

 xmlValue(xmlTextNode("some more raw text"))

  # Setting the xmlValue().
 a = newXMLNode("a")
 xmlValue(a) = "the text"
 xmlValue(a) = "different text"

 a = newXMLNode("x", "bob")
 xmlValue(a) = "joe"

 b = xmlNode("bob")
 xmlValue(b) = "Foo"
 xmlValue(b) = "again"

 b = newXMLNode("bob", "some text")
 xmlValue(b[[1]]) = "change"
 b



