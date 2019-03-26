library(mvbutils)


### Name: mlazy
### Title: Cacheing objects for lazy-load access
### Aliases: mlazy mtidy demlazy mcachees attach.mlazy
### Keywords: programming data

### ** Examples

## Not run: 
##D biggo <- matrix( runif( 1e6), 1000, 1000)
##D gc() # lots of memory
##D mlazy( biggo)
##D gc() # still lots of memory
##D mtidy( biggo)
##D gc() # better
##D biggo[1,1]
##D gc() # worse; it's been reloaded
## End(Not run)



