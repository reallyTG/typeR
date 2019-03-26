library(drake)


### Name: drake_gc
### Title: Do garbage collection on the drake cache.
### Aliases: drake_gc

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D make(my_plan) # Run the project, build the targets.
##D # At this point, check the size of the '.drake/' cache folder.
##D # Clean without garbage collection.
##D clean(garbage_collection = FALSE)
##D # The '.drake/' cache folder is still about the same size.
##D drake_gc() # Do garbage collection on the cache.
##D # The '.drake/' cache folder should have gotten much smaller.
##D })
## End(Not run)



