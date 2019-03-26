library(curl)


### Name: handle_cookies
### Title: Extract cookies from a handle
### Aliases: handle_cookies

### ** Examples

h <- new_handle()
handle_cookies(h)

# Server sets cookies
req <- curl_fetch_memory("http://httpbin.org/cookies/set?foo=123&bar=ftw", handle = h)
handle_cookies(h)

# Server deletes cookies
req <- curl_fetch_memory("http://httpbin.org/cookies/delete?foo", handle = h)
handle_cookies(h)

# Cookies will survive a reset!
handle_reset(h)
handle_cookies(h)



