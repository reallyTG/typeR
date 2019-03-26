library(RCurl)


### Name: binaryBuffer
### Title: Create internal C-level data structure for collecting binary
###   data
### Aliases: binaryBuffer coerce,RCurlBinaryBuffer,raw-method
### Keywords: IO programming

### ** Examples

if(url.exists("http://www.omegahat.net/RCurl/xmlParse.html.gz")) {
  buf = binaryBuffer()

     # Now fetch the binary file.
  getURI("http://www.omegahat.net/RCurl/xmlParse.html.gz",
         write = getNativeSymbolInfo("R_curl_write_binary_data")$address,
         file = buf@ref)

   # Convert the internal data structure into an R raw vector
  b = as(buf, "raw")

 if(require(Rcompression)) 
   gunzip(b)
 }



