library(BBmisc)


### Name: do.call2
### Title: Execute a function call similar to 'do.call'.
### Aliases: do.call2

### ** Examples

## Not run: 
##D   library(microbenchmark)
##D   x = 1:1e7
##D   microbenchmark(do.call(head, list(x, n = 1)), do.call2("head", x, n = 1))
## End(Not run)



