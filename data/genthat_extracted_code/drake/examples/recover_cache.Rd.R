library(drake)


### Name: recover_cache
### Title: Load an existing drake files system cache if it exists or create
###   a new one otherwise.
### Aliases: recover_cache

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D clean(destroy = TRUE)
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D make(my_plan) # Run the project, build all the targets.
##D x <- recover_cache(".drake") # Recover the project's storr cache.
##D })
## End(Not run)



