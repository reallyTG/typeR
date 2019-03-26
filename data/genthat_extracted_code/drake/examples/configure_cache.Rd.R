library(drake)


### Name: configure_cache
### Title: Configure the hash algorithms, etc. of a drake cache.
### Aliases: configure_cache

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D clean(destroy = TRUE)
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D config <- make(my_plan) # Run the project, build all the targets.
##D # Locate the drake/storr cache of the project
##D # inside the master internal configuration list.
##D cache <- config$cache
##D long_hash(cache) # Return the long hash algorithm used.
##D # Change the long hash algorithm of the cache.
##D cache <- configure_cache(
##D   cache = cache,
##D   long_hash_algo = "murmur32",
##D   overwrite_hash_algos = TRUE
##D )
##D long_hash(cache) # Show the new long hash algorithm.
##D make(my_plan) # Changing the long hash puts the targets out of date.
##D })
## End(Not run)



