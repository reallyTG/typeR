library(XML)


### Name: dtdElement
### Title: Gets the definition of an element or entity from a DTD.
### Aliases: dtdElement dtdEntity
### Keywords: file

### ** Examples

 dtdFile <- system.file("exampleData","foo.dtd", package="XML")
 foo.dtd <- parseDTD(dtdFile)
 
   # Get the definition of the `entry1' element
 tmp <- dtdElement("variable", foo.dtd)
 xmlAttrs(tmp)

 tmp <- dtdElement("entry1", foo.dtd)

  # Get the definition of the `img' entity
 dtdEntity("img", foo.dtd)



