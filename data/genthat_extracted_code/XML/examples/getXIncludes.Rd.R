library(XML)


### Name: getXIncludes
### Title: Find the documents that are XInclude'd in an XML document
### Aliases: getXIncludes xmlXIncludes
### Keywords: IO

### ** Examples


  f = system.file("exampleData", "xinclude", "a.xml", package = "XML")

  getXIncludes(f, recursive = FALSE)




