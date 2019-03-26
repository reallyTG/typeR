library(freegroup)


### Name: identity
### Title: The identity element
### Aliases: identity id is.id is.identity is.id.free neutral

### ** Examples

id()
as.free(0)   # convenient R idiom for creating the identity

x <- rfree(10,3)
stopifnot(all(x == x + as.free(0)))
stopifnot(all(is.id(x-x)))




