library(httpRequest)


### Name: simplePostToHost
### Title: Sends Simple Post Request to HTTP Server (host)
### Aliases: simplePostToHost

### ** Examples

host <- "api.scb.se"
path <- "/OV0104/v1/doris/en/ssd"
data <- '{"format":"json"}'
simplePostToHost(host, path, data, contenttype="text/json")



