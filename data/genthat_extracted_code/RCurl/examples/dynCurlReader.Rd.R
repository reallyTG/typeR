library(RCurl)


### Name: dynCurlReader
### Title: Dynamically determine content-type of body from HTTP header and
###   set body reader
### Aliases: dynCurlReader
### Keywords: IO

### ** Examples


   # Each of these examples can be done with getURLContent().
   # These are here just to illustrate the dynamic reader.
if(url.exists("http://www.omegahat.net/Rcartogram/demo.jpg")) {
  header = dynCurlReader()
  curlPerform(url = "http://www.omegahat.net/Rcartogram/demo.jpg",
              headerfunction = header$update, curl = header$curl())
  class( header$value() )
  length( header$value() )
}

if(url.exists("http://www.omegahat.net/dd.gz")) {
     # gzip example.
  header = dynCurlReader()
  curlPerform(url = "http://www.omegahat.net/dd.gz",
              headerfunction = header$update, curl = header$curl())
  class( header$value() )
  length( header$value() )

  if(require(Rcompression))
     gunzip(header$value())
}


   # Character encoding example
## Not run: 
##D   header = dynCurlReader()
##D   curlPerform(url = "http://www.razorvine.net/test/utf8form/formaccepter.sn",
##D                postfields = c(text = "ABC", outputencoding =  "UTF-8"),
##D                verbose = TRUE,
##D                writefunction = header$update, curl = header$curl())
##D   class( header$value() )
##D   Encoding( header$value() )
## End(Not run)



