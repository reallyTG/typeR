library(document)


### Name: throw
### Title: Throw an Error
### Aliases: throw
### Keywords: internal

### ** Examples

tryCatch(document:::throw("Hello error!"), error = function(e) return(e))



