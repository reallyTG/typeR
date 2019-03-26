library(XML)


### Name: xmlElementsByTagName
### Title: Retrieve the children of an XML node with a specific tag name
### Aliases: xmlElementsByTagName
### Keywords: IO file

### ** Examples

## Not run: 
##D  doc <- xmlTreeParse("http://www.omegahat.net/Scripts/Data/mtcars.xml")
##D  xmlElementsByTagName(doc$children[[1]], "variable")
## End(Not run)

 doc <- xmlTreeParse(system.file("exampleData", "mtcars.xml", package="XML"))
 xmlElementsByTagName(xmlRoot(doc)[[1]], "variable")



