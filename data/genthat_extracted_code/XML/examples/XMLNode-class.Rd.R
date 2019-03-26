library(XML)


### Name: XMLNode-class
### Title: Classes to describe an XML node object.
### Aliases: XMLAbstractNode-class XMLAbstractNode-class RXMLNode-class
###   XMLNode-class XMLTreeNode-class XMLInternalNode-class
###   XMLInternalTextNode-class XMLInternalElementNode-class
###   XMLInternalCommentNode-class XMLInternalPINode-class
###   XMLInternalCDataNode-class XMLAttributeDeclNode-class
###   XMLDocumentFragNode-class XMLDocumentNode-class
###   XMLDocumentTypeNode-class XMLEntityDeclNode-class
###   XMLNamespaceDeclNode-class XMLXIncludeStartNode-class
###   XMLXIncludeEndNode-class XMLDTDNode-class
###   coerce,XMLAbstractNode,Date-method
###   coerce,XMLAbstractNode,POSIXct-method
###   coerce,XMLAbstractNode,URL-method
###   coerce,XMLAbstractNode,character-method
###   coerce,XMLAbstractNode,integer-method
###   coerce,XMLAbstractNode,logical-method
###   coerce,XMLAbstractNode,numeric-method XMLNamespaceDefinitions-class
### Keywords: classes

### ** Examples


           # An R-level XMLNode object
   a <- xmlNode("arg", attrs = c(default="T"),
                 xmlNode("name", "foo"), xmlNode("defaultValue","1:10"))

  xmlAttrs(a) = c(a = 1, b = "a string")



