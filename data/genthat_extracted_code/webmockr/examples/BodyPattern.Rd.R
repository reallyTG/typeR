library(webmockr)


### Name: BodyPattern
### Title: BodyPattern
### Aliases: BodyPattern
### Keywords: internal

### ** Examples

# make a request signature
bb <- RequestSignature$new(
  method = "get",
  uri = "https:/httpbin.org/get",
  options = list(
    body = list(foo = "bar", a = 5)
  )
)

# make body pattern object
z <- BodyPattern$new(pattern = list(foo = "bar"))
z$pattern
z$matches(bb$body)



