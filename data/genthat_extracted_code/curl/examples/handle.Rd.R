library(curl)


### Name: handle
### Title: Create and configure a curl handle
### Aliases: handle new_handle handle_setopt handle_setheaders
###   handle_setform handle_reset handle_data

### ** Examples

h <- new_handle()
handle_setopt(h, customrequest = "PUT")
handle_setform(h, a = "1", b = "2")
r <- curl_fetch_memory("http://httpbin.org/put", h)
cat(rawToChar(r$content))

# Or use the list form
h <- new_handle()
handle_setopt(h, .list = list(customrequest = "PUT"))
handle_setform(h, .list = list(a = "1", b = "2"))
r <- curl_fetch_memory("http://httpbin.org/put", h)
cat(rawToChar(r$content))



