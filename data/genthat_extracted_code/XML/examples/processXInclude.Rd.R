library(XML)


### Name: processXInclude
### Title: Perform the XInclude substitutions
### Aliases: processXInclude processXInclude.list
###   processXInclude.XMLInternalDocument
###   processXInclude.XMLInternalElement
### Keywords: IO programming

### ** Examples


  f = system.file("exampleData", "include.xml", package = "XML")
  doc = xmlInternalTreeParse(f, xinclude = FALSE)

  cat(saveXML(doc))
  sects = getNodeSet(doc, "//section")
  sapply(sects, function(x) xmlName(x[[2]]))
  processXInclude(doc)

  cat(saveXML(doc))

  f = system.file("exampleData", "include.xml", package = "XML")
  doc = xmlInternalTreeParse(f, xinclude = FALSE)
  section1 = getNodeSet(doc, "//section")[[1]]

     # process 
  processXInclude(section1[[2]])



