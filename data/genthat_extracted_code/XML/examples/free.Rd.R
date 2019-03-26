library(XML)


### Name: free
### Title: Release the specified object and clean up its memory usage
### Aliases: free free,XMLInternalDocument-method
### Keywords: IO

### ** Examples

 f = system.file("exampleData", "boxplot.svg", package = "XML")
 doc = xmlParse(f)
 nodes = getNodeSet(doc, "//path")
 rm(nodes)
 # free(doc)



