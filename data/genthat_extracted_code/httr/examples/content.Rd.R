library(httr)


### Name: content
### Title: Extract content from a request.
### Aliases: content text_content parsed_content

### ** Examples

r <- POST("http://httpbin.org/post", body = list(a = 1, b = 2))
content(r) # automatically parses JSON
cat(content(r, "text"), "\n") # text content
content(r, "raw") # raw bytes from server

rlogo <- content(GET("http://cran.r-project.org/Rlogo.jpg"))
plot(0:1, 0:1, type = "n")
rasterImage(rlogo, 0, 0, 1, 1)



