library(httr)


### Name: upload_file
### Title: Upload a file with 'POST()' or 'PUT()'.
### Aliases: upload_file

### ** Examples

citation <- upload_file(system.file("CITATION"))
POST("http://httpbin.org/post", body = citation)
POST("http://httpbin.org/post", body = list(y = citation))



