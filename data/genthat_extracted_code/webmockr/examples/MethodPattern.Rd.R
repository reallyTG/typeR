library(webmockr)


### Name: MethodPattern
### Title: MethodPattern
### Aliases: MethodPattern
### Keywords: internal

### ** Examples

(x <- MethodPattern$new(pattern = "post"))
x$pattern
x$matches(method = "post")
x$matches(method = "POST")



