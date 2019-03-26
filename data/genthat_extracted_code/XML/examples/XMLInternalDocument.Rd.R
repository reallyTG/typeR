library(XML)


### Name: XMLInternalDocument-class
### Title: Class to represent reference to C-level data structure for an
###   XML document
### Aliases: XMLAbstractDocument-class XMLInternalDocument-class
###   HTMLInternalDocument-class
###   coerce,XMLInternalNode,XMLInternalDocument-method
###   coerce,XMLInternalDocument,XMLInternalNode-method
###   coerce,XMLDocument,XMLInternalDocument-method
### Keywords: classes

### ** Examples


 f = system.file("exampleData", "mtcars.xml", package="XML")
 doc = xmlParse(f)
 getNodeSet(doc, "//variables[@count]")
 getNodeSet(doc, "//record")

 getNodeSet(doc, "//record[@id='Mazda RX4']")

 # free(doc)



