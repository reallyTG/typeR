library(drake)


### Name: cache_path
### Title: Return the file path where the cache is stored, if applicable.
### Aliases: cache_path

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D clean(destroy = TRUE)
##D # Get/create a new drake/storr cache.
##D cache <- recover_cache()
##D # Show the file path of the cache.
##D cache_path(cache = cache)
##D # In-memory caches do not have file paths.
##D mem <- storr_environment()
##D cache_path(cache = mem)
##D })
## End(Not run)



