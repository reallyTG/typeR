library(httr)


### Name: VERB
### Title: VERB a url.
### Aliases: VERB

### ** Examples

r <- VERB(
  "PROPFIND", "http://svn.r-project.org/R/tags/",
  add_headers(depth = 1), verbose()
)
stop_for_status(r)
content(r)

VERB("POST", url = "http://httpbin.org/post")
VERB("POST", url = "http://httpbin.org/post", body = "foobar")



