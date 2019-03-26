library(jug)


### Name: jug
### Title: New jug instance
### Aliases: jug

### ** Examples

## No test: 
# This Hello World example will serve a jug instance on the default port.
# The jug instance will return "Hello World!" if a GET request is send to it.
jug() %>%
 get("/", function(req, res, err) "Hello World!" ) %>%
 simple_error_handler_json() %>%
 serve_it(verbose=TRUE)
## End(No test)

## No test: 
# Introduction to jug
vignette("jug", package="jug")
## End(No test)




