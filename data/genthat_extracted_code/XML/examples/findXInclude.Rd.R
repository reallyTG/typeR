library(XML)


### Name: findXInclude
### Title: Find the XInclude node associated with an XML node
### Aliases: findXInclude
### Keywords: IO

### ** Examples


 f = system.file("exampleData", "functionTemplate.xml", package = "XML")

 cat(readLines(f), "\n")

 doc = xmlParse(f)

  # Get all the para nodes
  # We just want to look at the 2nd and 3rd which are repeats of the
  # first one.
 a = getNodeSet(doc, "//author")
 findXInclude(a[[1]])

 i = findXInclude(a[[1]], TRUE)
 top = getSibling(i)

   # Determine the top-level included nodes
 tmp = getSibling(i)
 nodes = list()
 while(!inherits(tmp, "XMLXIncludeEndNode")) {
   nodes = c(nodes, tmp)
   tmp = getSibling(tmp)
 }



