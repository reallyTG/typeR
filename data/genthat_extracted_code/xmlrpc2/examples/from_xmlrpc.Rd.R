library(xmlrpc2)


### Name: from_xmlrpc
### Title: Convert from the 'XML-RPC' Format into an R Object.
### Aliases: from_xmlrpc

### ** Examples

params <- list(1L, 1:3, rnorm(3), LETTERS[1:3], charToRaw("A"))
xml <- to_xmlrpc("some_method", params)
from_xmlrpc(xml)



