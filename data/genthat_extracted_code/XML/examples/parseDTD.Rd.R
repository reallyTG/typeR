library(XML)


### Name: parseDTD
### Title: Read a Document Type Definition (DTD)
### Aliases: parseDTD
### Keywords: file IO

### ** Examples

 dtdFile <- system.file("exampleData", "foo.dtd",package="XML")
 parseDTD(dtdFile)

txt <- readLines(dtdFile)
txt <- paste(txt,  collapse="\n")
d <- parseDTD(txt, asText=TRUE)


## Not run: 
##D  url <- "http://www.omegahat.net/XML/DTDs/DatasetByRecord.dtd"
##D  d <- parseDTD(url, asText=FALSE)  
## End(Not run)



