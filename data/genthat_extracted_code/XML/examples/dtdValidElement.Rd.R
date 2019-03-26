library(XML)


### Name: dtdValidElement
### Title: Determines whether an XML tag is valid within another.
### Aliases: dtdValidElement
### Keywords: file

### ** Examples

 dtdFile <- system.file("exampleData", "foo.dtd", package="XML")
 foo.dtd <- parseDTD(dtdFile)

  # The following are true.
 dtdValidElement("variable","variables", dtd = foo.dtd)
 dtdValidElement("record","dataset", dtd = foo.dtd)

  # This is false.
 dtdValidElement("variable","dataset", dtd = foo.dtd)



