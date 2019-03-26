library(xmlrpc2)


### Name: to_xmlrpc
### Title: Create a 'XML-RPC' Call
### Aliases: to_xmlrpc

### ** Examples

params <- list(1L, 1:3, rnorm(3), LETTERS[1:3], charToRaw("A"))
cat(as.character(to_xmlrpc("some_method", params)))



