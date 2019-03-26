library(drake)


### Name: short_hash
### Title: Get the short hash algorithm of a drake cache.
### Aliases: short_hash

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D # Run the project and return the internal master configuration list.
##D config <- make(my_plan)
##D # Locate the storr cache.
##D cache <- config$cache
##D # Get the short hash algorithm of the cache.
##D short_hash(cache)
##D })
## End(Not run)



