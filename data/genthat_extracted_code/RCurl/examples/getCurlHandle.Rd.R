library(RCurl)


### Name: getCurlHandle
### Title: Create libcurl handles
### Aliases: getCurlHandle getCurlMultiHandle dupCurlHandle
### Keywords: IO

### ** Examples


  options(RCurlOptions = list(verbose = TRUE,
                              followlocation = TRUE,
                              autoreferer = TRUE,
                              nosignal = TRUE))
  if(url.exists("http://www.omegahat.net/RCurl")) {
     x = getURL("http://www.omegahat.net/RCurl")
        # here we override one of these.
     x = getURL("http://www.omegahat.net/RCurl", verbose = FALSE)
  }



