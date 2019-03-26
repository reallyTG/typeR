library(httr)


### Name: handle
### Title: Create a handle tied to a particular host.
### Aliases: handle

### ** Examples

handle("http://google.com")
handle("https://google.com")

h <- handle("http://google.com")
GET(handle = h)
# Should see cookies sent back to server
GET(handle = h, config = verbose())

h <- handle("http://google.com", cookies = FALSE)
GET(handle = h)$cookies
## Not run: 
##D # Using the preferred way of configuring the http methods
##D # will not work when using handle():
##D GET(handle = h, timeout(10))
##D # Passing named arguments will work properly:
##D GET(handle = h, config = list(timeout(10), add_headers(Accept = "")))
## End(Not run)




