library(drake)


### Name: find_project
### Title: Search up the file system for the nearest root path of a drake
###   project.
### Aliases: find_project

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D make(my_plan) # Run the project, build the target.
##D # Find the root directory of the current drake project.
##D # Search up through parent directories if necessary.
##D find_cache()
##D })
## End(Not run)



