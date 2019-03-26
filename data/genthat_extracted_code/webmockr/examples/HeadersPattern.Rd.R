library(webmockr)


### Name: HeadersPattern
### Title: HeadersPattern
### Aliases: HeadersPattern
### Keywords: internal

### ** Examples

(x <- HeadersPattern$new(pattern = list(a = 5)))
x$pattern
x$matches(list(a = 5))

# different cases
(x <- HeadersPattern$new(pattern = list(Header1 = "value1")))
x$pattern
x$matches(list(header1 = "value1"))
x$matches(list(header1 = "value2"))

# different symbols
(x <- HeadersPattern$new(pattern = list(`Hello_World` = "yep")))
x$pattern
x$matches(list(`hello-world` = "yep"))
x$matches(list(`hello-worlds` = "yep"))



