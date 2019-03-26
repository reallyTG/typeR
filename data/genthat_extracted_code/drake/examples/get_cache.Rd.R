library(drake)


### Name: get_cache
### Title: Get the drake cache, optionally searching up the file system.
### Aliases: get_cache

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D clean(destroy = TRUE)
##D # No cache is available.
##D get_cache() # NULL
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D make(my_plan) # Run the project, build the targets.
##D x <- get_cache() # Now, there is a cache.
##D # List the objects readable from the cache with readd().
##D x$list() # Or x$list(namespace = x$default_namespace)
##D })
## End(Not run)



