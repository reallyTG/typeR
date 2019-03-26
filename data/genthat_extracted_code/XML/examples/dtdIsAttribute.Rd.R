library(XML)


### Name: dtdIsAttribute
### Title: Query if a name is a valid attribute of a DTD element.
### Aliases: dtdIsAttribute
### Keywords: file

### ** Examples

 dtdFile <- system.file("exampleData", "foo.dtd", package="XML")
 foo.dtd <- parseDTD(dtdFile)

    # true
  dtdIsAttribute("numRecords", "dataset", foo.dtd)

    # false
  dtdIsAttribute("date", "dataset", foo.dtd)



