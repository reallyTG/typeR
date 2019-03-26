library(drake)


### Name: clean
### Title: Remove targets/imports from the cache.
### Aliases: clean

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D make(my_plan) # Run the project, build the targets.
##D # List objects in the cache, excluding R objects
##D # imported from your workspace.
##D cached(no_imported_objects = TRUE)
##D # Remove 'summ_regression1_large' and 'small' from the cache.
##D clean(summ_regression1_large, small)
##D # Those objects should be gone.
##D cached(no_imported_objects = TRUE)
##D # Rebuild the missing targets.
##D make(my_plan)
##D # Remove all the targets and imports.
##D # On non-Windows machines, parallelize over at most 2 jobs.
##D clean(jobs = 2)
##D # Make the targets again.
##D make(my_plan)
##D # Garbage collection removes data whose references are no longer present.
##D # It is slow, but you should enable it if you want to reduce the
##D # size of the cache.
##D clean(garbage_collection = TRUE)
##D # All the targets and imports are gone.
##D cached()
##D # But there is still cached metadata.
##D names(read_drake_meta())
##D build_times()
##D # To make even more room, use the "purge" flag.
##D clean(purge = TRUE)
##D names(read_drake_meta())
##D build_times()
##D # Completely remove the entire cache (default: '.drake/' folder).
##D clean(destroy = TRUE)
##D })
## End(Not run)



