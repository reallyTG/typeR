library(memoise)


### Name: forget
### Title: Forget past results. Resets the cache of a memoised function.
### Aliases: forget

### ** Examples

memX <- memoise(function() { Sys.sleep(1); runif(1) })
# The forget() function
system.time(print(memX()))
system.time(print(memX()))
forget(memX)
system.time(print(memX()))



