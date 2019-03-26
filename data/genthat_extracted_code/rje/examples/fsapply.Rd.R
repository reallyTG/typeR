library(rje)


### Name: fsapply
### Title: Fast and loose application of function over list.
### Aliases: fsapply
### Keywords: list

### ** Examples

x = list(1:1000)
tmp = fsapply(x, sin)

## Not run: 
##D x = list()
##D set.seed(142313)
##D for (i in 1:1000) x[[i]] = rnorm(100)
##D 
##D system.time(for (i in 1:100) sapply(x, function(x) last(x)))
##D system.time(for (i in 1:100) fsapply(x, function(x) last(x)))
## End(Not run)



