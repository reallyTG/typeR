library(RNeXML)


### Name: nexml_read
### Title: Read NeXML files into various R formats
### Aliases: nexml_read read.nexml nexml_read.character
###   nexml_read.XMLInternalDocument nexml_read.XMLInternalNode

### ** Examples

# file
f <- system.file("examples", "trees.xml", package="RNeXML")
nexml_read(f)
## Not run: 
##D  # may take > 5 s
##D # url
##D url <- "https://raw.githubusercontent.com/ropensci/RNeXML/master/inst/examples/trees.xml"
##D nexml_read(url)
##D # character string of XML
##D str <- paste0(readLines(f), collapse = "")
##D nexml_read(str)
##D # XMLInternalDocument
##D library("httr")
##D library("XML")
##D x <- xmlParse(content(GET(url)))
##D nexml_read(x)
##D # XMLInternalNode
##D nexml_read(xmlRoot(x))
## End(Not run)



