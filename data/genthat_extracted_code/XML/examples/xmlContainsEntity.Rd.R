library(XML)


### Name: xmlContainsEntity
### Title: Checks if an entity is defined within a DTD.
### Aliases: xmlContainsEntity xmlContainsElement
### Keywords: file

### ** Examples

 dtdFile <- system.file("exampleData", "foo.dtd", package="XML")
 foo.dtd <- parseDTD(dtdFile)
 
  # Look for entities.
 xmlContainsEntity("foo", foo.dtd)
 xmlContainsEntity("bar", foo.dtd)

  # Now look for an element
 xmlContainsElement("record", foo.dtd)



