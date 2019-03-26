library(RCurl)


### Name: getURIAsynchronous
### Title: Download multiple URIs concurrently, with inter-leaved downloads
### Aliases: getURIAsynchronous getURLAsynchronous
### Keywords: IO

### ** Examples

  uris = c("http://www.omegahat.net/RCurl/index.html",
           "http://www.omegahat.net/RCurl/philosophy.xml")
  txt = getURIAsynchronous(uris)
  names(txt)
  nchar(txt)



