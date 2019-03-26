library(request)


### Name: api_body
### Title: Query construction
### Aliases: api_body api_body_

### ** Examples

## Not run: 
##D ## NSE
##D dd <- api("http://httpbin.org/post")
##D dd %>% api_body(body_value = NULL) %>% http("POST")
##D dd %>% api_body(body_value = "") %>% http("POST")
##D 
##D ## other named parameters are passed as form values
##D dd %>% api_body(x = hello) %>% http("POST")
##D 
##D # upload a file
##D file <- "~/some_test.txt"
##D cat("hello, world", file = file)
##D dd %>% api_body(x = upload_file("~/some_test.txt")) %>% http("POST")
##D 
##D # A named list
##D dd %>% api_body(x = hello, y = stuff) %>% http("POST")
##D 
##D ## SE
##D dd %>% api_body_(x = "hello", y = "stuff") %>% http("POST")
## End(Not run)



