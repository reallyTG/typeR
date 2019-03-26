library(MazamaWebUtils)


### Name: cgiRequest
### Title: Create a CGI Request Object
### Aliases: cgiRequest

### ** Examples

# Example borrowed from webutils::parse_query
q <- "foo=1%2B1%3D2&bar=yin%26yang"
req <- cgiRequest(q)
str(req$params)



