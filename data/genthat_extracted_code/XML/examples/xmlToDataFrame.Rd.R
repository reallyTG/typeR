library(XML)


### Name: xmlToDataFrame
### Title: Extract data from a simple XML document
### Aliases: xmlToDataFrame xmlToDataFrame,character,ANY,ANY,ANY,ANY-method
###   xmlToDataFrame,XMLInternalDocument,ANY,ANY,ANY,missing-method
###   xmlToDataFrame,ANY,ANY,ANY,ANY,XMLNodeSet-method
###   xmlToDataFrame,ANY,ANY,ANY,ANY,XMLInternalNodeList-method
###   xmlToDataFrame,ANY,ANY,ANY,ANY,list-method
###   xmlToDataFrame,XMLInternalNodeList,ANY,ANY,ANY,ANY-method
###   xmlToDataFrame,XMLInternalElementNode,ANY,ANY,ANY,ANY-method
###   xmlToDataFrame,XMLNodeSet,ANY,ANY,ANY,ANY-method
###   xmlToDataFrame,list,ANY,ANY,ANY,ANY-method
### Keywords: IO

### ** Examples

 f = system.file("exampleData", "size.xml", package = "XML")
 xmlToDataFrame(f, c("integer", "integer", "numeric"))

   # Drop the middle variable.
 z = xmlToDataFrame(f, colClasses = list("integer", NULL, "numeric"))


   #  This illustrates how we can get a subset of nodes and process
   #  those as the "data nodes", ignoring the others.
  f = system.file("exampleData", "tides.xml", package = "XML")
  doc = xmlParse(f)
  xmlToDataFrame(nodes = xmlChildren(xmlRoot(doc)[["data"]]))

    # or, alternatively
  xmlToDataFrame(nodes = getNodeSet(doc, "//data/item"))


  f = system.file("exampleData", "kiva_lender.xml", package = "XML")
  doc = xmlParse(f)
  dd = xmlToDataFrame(getNodeSet(doc, "//lender"))



