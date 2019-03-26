library(httr)


### Name: cache_info
### Title: Compute caching information for a response.
### Aliases: cache_info rerequest

### ** Examples

# Never cached, always causes redownload
r1 <- GET("https://www.google.com")
cache_info(r1)
r1$date
rerequest(r1)$date

# Expires in a year
r2 <- GET("https://www.google.com/images/srpr/logo11w.png")
cache_info(r2)
r2$date
rerequest(r2)$date

# Has last-modified and etag, so does revalidation
r3 <- GET("http://httpbin.org/cache")
cache_info(r3)
r3$date
rerequest(r3)$date

# Expires after 5 seconds
## Not run: 
##D r4 <- GET("http://httpbin.org/cache/5")
##D cache_info(r4)
##D r4$date
##D rerequest(r4)$date
##D Sys.sleep(5)
##D cache_info(r4)
##D rerequest(r4)$date
## End(Not run)



