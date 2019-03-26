library(RCurl)


### Name: curlSetOpt
### Title: Set values for the CURL options
### Aliases: curlSetOpt
### Keywords: IO

### ** Examples

if(url.exists("http://www.omegahat.net")) {

  curl = getCurlHandle()
     # Note the header that extends across two lines with the second line
     # prefixed with white space.
   curlSetOpt( .opts = list(httpheader = c(Date = "Wed, 1/2/2000 10:01:01",
                            foo="abc\n    extra line"), verbose = TRUE),
               curl = curl)
   ans = getURL("http://www.omegahat.net", curl = curl)
}



