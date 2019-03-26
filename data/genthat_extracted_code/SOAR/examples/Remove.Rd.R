library(SOAR)


### Name: Remove
### Title: Remove stored objects from the disc.
### Aliases: Remove RemoveData RemoveUtils
### Keywords: utilities

### ** Examples

## change default cache, keeping any previous setting
oldLC <- Sys.getenv("R_LOCAL_CACHE", unset = ".R_Cache")
Sys.setenv(R_LOCAL_CACHE=".R_Test")

## generate some dummy data
dummy <- rnorm(100)
mn <- mean(dummy)
va <- var(dummy)

## store it in the stored object cache
Store(dummy, mn, va)
Search()
Objects()
Remove(mn, va)
Objects()
Remove(Objects())                   # empty the cache
detach(".R_Test")                   # remove from search path
Sys.setenv(R_LOCAL_CACHE=oldLC)     # restore normal default



