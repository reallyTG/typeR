library(OpenRepGrid)


### Name: sapply_pb
### Title: sapply with a progress bar
### Aliases: sapply_pb
### Keywords: internal

### ** Examples

## Not run: 
##D 
##D    l <- sapply(1:20000, function(x) list(rnorm(1000)))
##D    head(sapply_pb(l, mean))
##D 
##D    # performance comparison
##D    l <- sapply(1:20000, function(x) list(rnorm(1000)))
##D    system.time(sapply(l, mean))
##D    system.time(sapply_pb(l, mean))
##D 
## End(Not run)



