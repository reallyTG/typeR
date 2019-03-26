library(document)


### Name: warn
### Title: Throw a Warning
### Aliases: warn
### Keywords: internal

### ** Examples

tryCatch(document:::warn("Hello error!"), error = function(e) return(e))



