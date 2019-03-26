library(RCurl)


### Name: getFormParams
### Title: Extract parameters from a form query string
### Aliases: getFormParams
### Keywords: programming interface

### ** Examples

if(url.exists("http://www.omegahat.net/foo/bob.R")) {

  getFormParams("http://www.omegahat.net/foo/bob.R?xyz=1&abc=verylong")

  getFormParams("xyz=1&abc=verylong")
  getFormParams("xyz=1&abc=&on=true")
  getFormParams("xyz=1&abc=")
}



