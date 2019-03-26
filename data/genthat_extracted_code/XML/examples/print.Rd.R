library(XML)


### Name: print.XMLAttributeDef
### Title: Methods for displaying XML objects
### Aliases: print.XMLAttributeDef print.XMLCDataNode
###   print.XMLElementContent print.XMLElementDef print.XMLEntity
###   print.XMLEntityRef print.XMLNode print.XMLTextNode print.XMLComment
###   print.XMLOrContent print.XMLSequenceContent
###   print.XMLProcessingInstruction
### Keywords: IO file

### ** Examples

  fileName <- system.file("exampleData", "event.xml", package ="XML")

     # Example of how to get faithful copy of the XML.
  doc = xmlRoot(xmlTreeParse(fileName, trim = FALSE, ignoreBlanks = FALSE))
  print(doc, indent = FALSE, tagSeparator = "")

     # And now the default mechanism
  doc = xmlRoot(xmlTreeParse(fileName))
  print(doc)



