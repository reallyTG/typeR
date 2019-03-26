library(XML)


### Name: xmlHandler
### Title: Example XML Event Parser Handler Functions
### Aliases: xmlHandler
### Keywords: file IO

### ** Examples

## Not run: 
##D xmlURL <- "http://www.omegahat.net/Scripts/Data/mtcars.xml"
##D xmlText <- paste(scan(xmlURL, what="", sep="\n"),"\n",collapse="\n")
## End(Not run)

xmlURL <- system.file("exampleData", "mtcars.xml", package="XML")
xmlText <- paste(readLines(xmlURL), "\n", collapse="")
xmlEventParse(xmlText, handlers = NULL, asText=TRUE)
xmlEventParse(xmlText, xmlHandler(), useTagName=TRUE, asText=TRUE)



