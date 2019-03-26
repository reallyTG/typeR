library(RCurl)


### Name: clone
### Title: Clone/duplicate an object
### Aliases: clone clone,ANY-method clone,CURLHandle-method
###   clone,environment-method clone,CFILE-method
### Keywords: programming

### ** Examples

 h = getCurlHandle(verbose = TRUE)
 other = dupCurlHandle(h)
 curlSetOpt(curl = h, verbose = FALSE)



