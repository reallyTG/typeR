library(XML)


### Name: parseURI
### Title: Parse a URI string into its elements
### Aliases: parseURI URI-class coerce,URI,character-method
### Keywords: IO

### ** Examples

  parseURI("http://www.omegahat.net:8080/RCurl/index.html")
  parseURI("ftp://duncan@www.omegahat.net:8080/RCurl/index.html")

  parseURI("ftp://duncan@www.omegahat.net:8080/RCurl/index.html#my_anchor")

  as(parseURI("http://duncan@www.omegahat.net:8080/RCurl/index.html#my_anchor"), "character")

  as(parseURI("ftp://duncan@www.omegahat.net:8080/RCurl/index.html?foo=1&bar=axd"), "character")



