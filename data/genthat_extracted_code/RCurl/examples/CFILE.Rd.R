library(RCurl)


### Name: CFILE
### Title: Create a C-level handle for a file
### Aliases: CFILE CFILE-class close,CFILE-method
### Keywords: IO

### ** Examples

## Not run: 
##D filename = system.file("tests", "amazon3.R", package = "RCurl")
##D f = CFILE(filename)
##D 
##D if(url.exists('http://s3.amazonaws.com/'))
##D   curlPerform(url = "http://s3.amazonaws.com/RRupload/duncan2",
##D               upload = TRUE,
##D               readdata = f@ref,
##D               infilesize = file.info(filename)[1, "size"])
## End(Not run)



