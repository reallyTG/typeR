library(datadr)


### Name: readHDFStextFile
### Title: Experimental HDFS text reader helper function
### Aliases: readHDFStextFile

### ** Examples

## Not run: 
##D res <- readHDFStextFile(
##D   input = Rhipe::rhfmt("/path/to/input/text", type = "text"),
##D   output = hdfsConn("/path/to/output"),
##D   fn = function(x) {
##D     read.csv(textConnection(paste(x, collapse = "\n")), header = FALSE)
##D   }
##D )
## End(Not run)



