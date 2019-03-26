library(drake)


### Name: rescue_cache
### Title: Try to repair a drake cache that is prone to throwing
###   'storr'-related errors.
### Aliases: rescue_cache

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D make(my_plan) # Run the project, build targets. This creates the cache.
##D # Remove dangling cache files that could cause errors.
##D rescue_cache(jobs = 2)
##D # Alternatively, just rescue targets 'small' and 'large'.
##D # Rescuing specific targets is usually faster.
##D rescue_cache(targets = c("small", "large"))
##D })
## End(Not run)



