library(drake)


### Name: find_cache
### Title: Search up the file system for the nearest drake cache.
### Aliases: find_cache

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D make(my_plan) # Run the project, build the target.
##D # Find the file path of the project's cache.
##D # Search up through parent directories if necessary.
##D find_cache()
##D })
## End(Not run)



