library(RCurl)


### Name: getCurlInfo
### Title: Access information about a CURL request
### Aliases: getCurlInfo getCurlInfoConstants
### Keywords: IO

### ** Examples

 if(url.exists("http://www.omegahat.net/RCurl/index.html")) {
    curl = getCurlHandle()
    getURL("http://www.omegahat.net/RCurl/index.html", curl = curl)
    getCurlInfo(curl)
    rm(curl)  # release the curl!
 }



