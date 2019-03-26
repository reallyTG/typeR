library(crul)


### Name: auth
### Title: Authentication
### Aliases: auth

### ** Examples

auth(user = "foo", pwd = "bar", auth = "basic")
auth(user = "foo", pwd = "bar", auth = "digest")
auth(user = "foo", pwd = "bar", auth = "ntlm")
auth(user = "foo", pwd = "bar", auth = "any")

# gssnegotiate auth
auth(NULL, NULL, "gssnegotiate")

## Not run: 
##D # with HttpClient
##D (res <- HttpClient$new(
##D   url = "https://httpbin.org/basic-auth/user/passwd",
##D   auth = auth(user = "user", pwd = "passwd")
##D ))
##D res$auth
##D x <- res$get()
##D jsonlite::fromJSON(x$parse("UTF-8"))
##D 
##D # with HttpRequest
##D (res <- HttpRequest$new(
##D   url = "https://httpbin.org/basic-auth/user/passwd",
##D   auth = auth(user = "user", pwd = "passwd")
##D ))
##D res$auth
## End(Not run)



