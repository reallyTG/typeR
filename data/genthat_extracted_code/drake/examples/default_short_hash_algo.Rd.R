library(drake)


### Name: default_short_hash_algo
### Title: Return the default short hash algorithm for 'make()'.
### Aliases: default_short_hash_algo

### ** Examples

default_short_hash_algo()
## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D # Run the project and return the internal master configuration list.
##D config <- make(my_plan)
##D # Locate the storr cache.
##D cache <- config$cache
##D # Get the default short hash algorithm of an existing cache.
##D default_short_hash_algo(cache)
##D })
## End(Not run)



