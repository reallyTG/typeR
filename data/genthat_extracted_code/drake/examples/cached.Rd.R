library(drake)


### Name: cached
### Title: Enumerate cached targets or check if a target is cached.
### Aliases: cached

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Load drake's canonical example.
##D make(my_plan) # Run the project, build all the targets.
##D cached(list = 'reg1') # Is 'reg1' in the cache?
##D # List all the targets and imported files in the cache.
##D # Exclude R objects imported from your workspace.
##D cached(no_imported_objects = TRUE)
##D # List all targets and imports in the cache.
##D cached()
##D # Clean the main data.
##D clean()
##D # The targets and imports are gone.
##D cached()
##D # But there is still metadata.
##D build_times()
##D cached(namespace = "build_times")
##D # Clear that too.
##D clean(purge = TRUE)
##D cached(namespace = "build_times")
##D build_times()
##D })
## End(Not run)



