library(XML)


### Name: getEncoding
### Title: Determines the encoding for an XML document or node
### Aliases: getEncoding getEncoding,XMLInternalDocument-method
###   getEncoding,XMLInternalNode-method getEncoding,ANY-method
### Keywords: IO

### ** Examples

  f = system.file("exampleData", "charts.svg", package = "XML")
  doc = xmlParse(f)
  getEncoding(doc)
  n = getNodeSet(doc, "//g/text")[[1]]
  getEncoding(n)

  f = system.file("exampleData", "iTunes.plist", package = "XML")
  doc = xmlParse(f)
  getEncoding(doc)



