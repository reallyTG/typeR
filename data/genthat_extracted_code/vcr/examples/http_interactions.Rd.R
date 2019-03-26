library(vcr)


### Name: http_interactions
### Title: Get the http interactions of the current cassette
### Aliases: http_interactions

### ** Examples

## Not run: 
##D vcr_configure(dir = tempdir())
##D insert_cassette("foo_bar")
##D webmockr::webmockr_allow_net_connect()
##D library(crul)
##D cli <- crul::HttpClient$new("https://eu.httpbin.org/get")
##D one <- cli$get(query = list(a = 5))
##D z <- http_interactions()
##D z
##D z$interactions
##D z$used_interactions
##D eject_cassette("foo_bar")
##D # cleanup
##D unlink(file.path(tempdir(), "foo_bar.yml"))
## End(Not run)



