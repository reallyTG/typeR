library(HARtools)


### Name: writeHAR
### Title: Write HAR object to file
### Aliases: writeHAR

### ** Examples

## Not run: 
##D har1 <- readHAR(system.file(package = "HARtools",
##D                            "exdata", "google.com.har"))
##D harFile <- tempfile(fileext = ".har")
##D writeHAR(har1, harFile)
##D har2 <- readHAR(harFile)
##D identical(har1, har2)
## End(Not run)



