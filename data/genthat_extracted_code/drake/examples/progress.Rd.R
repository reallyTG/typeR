library(drake)


### Name: progress
### Title: Get the build progress of your targets during a 'make()'.
### Aliases: progress

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D make(my_plan) # Run the project, build the targets.
##D # Watch the changing progress() as make() is running.
##D progress() # List all the targets reached so far.
##D progress(small, large) # Just see the progress of some targets.
##D progress(list = c("small", "large")) # Same as above.
##D progress(no_imported_objects = TRUE) # Ignore imported R objects.
##D })
## End(Not run)



