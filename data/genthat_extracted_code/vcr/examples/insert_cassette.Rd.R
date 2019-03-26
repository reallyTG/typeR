library(vcr)


### Name: insert_cassette
### Title: Insert a cassette to record HTTP requests
### Aliases: insert_cassette

### ** Examples

## Not run: 
##D library(vcr)
##D library(crul)
##D vcr_configure(dir = tempdir())
##D webmockr::webmockr_allow_net_connect()
##D 
##D (x <- insert_cassette(name = "leo5"))
##D current_cassette()
##D x$new_recorded_interactions
##D cli <- crul::HttpClient$new(url = "https://httpbin.org")
##D cli$get("get")
##D x$new_recorded_interactions
##D # very important when using inject_cassette: eject when done
##D x$eject() # same as eject_cassette("leo5")
##D 
##D # cleanup
##D unlink(file.path(tempdir(), "leo5.yml"))
## End(Not run)



