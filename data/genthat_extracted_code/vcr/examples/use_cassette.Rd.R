library(vcr)


### Name: use_cassette
### Title: Use a cassette
### Aliases: use_cassette

### ** Examples

## Not run: 
##D library(vcr)
##D library(crul)
##D vcr_configure(dir = tempdir())
##D 
##D use_cassette(name = "apple7", {
##D   cli <- HttpClient$new(url = "https://httpbin.org")
##D   resp <- cli$get("get")
##D })
##D readLines(file.path(tempdir(), "apple7.yml"))
##D 
##D # preserve exact body bytes - records in base64 encoding
##D use_cassette("things4", {
##D   cli <- crul::HttpClient$new(url = "https://httpbin.org")
##D   bbb <- cli$get("get")
##D }, preserve_exact_body_bytes = TRUE)
##D ## see the body string value in the output here
##D readLines(file.path(tempdir(), "things4.yml"))
##D 
##D # cleanup
##D unlink(file.path(tempdir(), c("things4.yml", "apple7.yml")))
##D 
##D 
##D # with httr
##D library(vcr)
##D library(httr)
##D vcr_configure(dir = tempdir(), log = TRUE)
##D 
##D use_cassette(name = "stuff350", {
##D   res <- GET("https://httpbin.org/get")
##D })
##D readLines(file.path(tempdir(), "stuff350.yml"))
##D 
##D use_cassette(name = "catfact456", {
##D   res <- GET("https://catfact.ninja/fact")
##D })
##D 
## End(Not run)



