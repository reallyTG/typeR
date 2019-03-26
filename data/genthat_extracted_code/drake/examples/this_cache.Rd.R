library(drake)


### Name: this_cache
### Title: Get the cache at the exact file path specified.
### Aliases: this_cache

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D clean(destroy = TRUE)
##D try(x <- this_cache(), silent = FALSE) # The cache does not exist yet.
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D make(my_plan) # Run the project, build the targets.
##D y <- this_cache() # Now, there is a cache.
##D z <- this_cache(".drake") # Same as above.
##D manual <- new_cache("manual_cache") # Make a new cache.
##D manual2 <- get_cache("manual_cache") # Get the new cache.
##D })
## End(Not run)



