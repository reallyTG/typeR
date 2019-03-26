library(XML)


### Name: dtdElementValidEntry
### Title: Determines whether an XML element allows a particular type of
###   sub-element.
### Aliases: dtdElementValidEntry.character
###   dtdElementValidEntry.XMLElementContent
###   dtdElementValidEntry.XMLElementDef dtdElementValidEntry.XMLOrContent
###   dtdElementValidEntry.XMLSequenceContent dtdElementValidEntry
### Keywords: file

### ** Examples

 dtdFile <- system.file("exampleData", "foo.dtd",package="XML")
 dtd <- parseDTD(dtdFile) 
 
  dtdElementValidEntry(dtdElement("variables",dtd), "variable")



