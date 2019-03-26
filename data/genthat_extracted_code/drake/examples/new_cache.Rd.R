library(drake)


### Name: new_cache
### Title: Make a new 'drake' cache.
### Aliases: new_cache

### ** Examples

## Not run: 
##D test_with_dir("Quarantine new_cache() side effects.", {
##D clean(destroy = TRUE) # Should not be necessary.
##D unlink("not_hidden", recursive = TRUE) # Should not be necessary.
##D cache1 <- new_cache() # Creates a new hidden '.drake' folder.
##D cache2 <- new_cache(path = "not_hidden", short_hash_algo = "md5")
##D clean(destroy = TRUE, cache = cache2)
##D })
## End(Not run)



