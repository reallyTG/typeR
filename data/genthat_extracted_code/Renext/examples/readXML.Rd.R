library(Renext)


### Name: readXML
### Title: Read data using an XML index file
### Aliases: readXML

### ** Examples

## Not run: 
##D ## Examples of datasets that can be read
##D ## Browse should work for browsers with xslt support
##D browseURL(file.path(system.file("Rendata", package = "Renext"), "index.xml"))
##D if (require(XML)) {
##D    ## use 'index.xml' file shiped with Renext
##D    dir1 <- system.file("Rendata", package = "Renext")
##D    BrestNew1 <- readXML(name = "Brest", dir = dir1)
##D    test1 <- readXML(name = "test1", dir = dir1)
##D }
## End(Not run)



