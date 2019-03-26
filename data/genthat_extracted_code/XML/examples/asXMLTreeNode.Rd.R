library(XML)


### Name: asXMLTreeNode
### Title: Convert a regular XML node to one for use in a "flat" tree
### Aliases: asXMLTreeNode
### Keywords: IO

### ** Examples

  txt = '<foo a="123" b="an attribute"><bar>some text</bar>other text</foo>'
  doc = xmlTreeParse(txt)

  class(xmlRoot(doc))

  as(xmlRoot(doc), "XMLInternalNode")



