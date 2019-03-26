library(XML)


### Name: getLineNumber
### Title: Determine the location - file & line number of an (internal) XML
###   node
### Aliases: getNodeLocation getNodePosition getLineNumber
### Keywords: IO

### ** Examples

f = system.file("exampleData", "xysize.svg", package = "XML")
doc = xmlParse(f)
e = getNodeSet(doc, "//ellipse")
sapply(e, getLineNumber)



