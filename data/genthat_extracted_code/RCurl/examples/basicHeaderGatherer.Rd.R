library(RCurl)


### Name: basicHeaderGatherer
### Title: Functions for processing the response header of a libcurl
###   request
### Aliases: basicHeaderGatherer parseHTTPHeader
### Keywords: IO

### ** Examples

  if(url.exists("http://www.omegahat.net/RCurl/index.html")) {
     h = basicHeaderGatherer()
     getURI("http://www.omegahat.net/RCurl/index.html",
              headerfunction = h$update)
     names(h$value())
     h$value()
  }



