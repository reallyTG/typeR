library(RCurl)


### Name: findHTTPHeaderEncoding
### Title: Find the encoding of the HTTP response from the HTTP header
### Aliases: findHTTPHeaderEncoding
### Keywords: IO programming

### ** Examples

findHTTPHeaderEncoding("Content-Type: text/html;charset=ISO-8859-1\r\n")
findHTTPHeaderEncoding("Content-Type: text/html; charset=utf-8\r\n")



