library(drake)


### Name: drake_get_session_info
### Title: Return the 'sessionInfo()' of the last call to 'make()'.
### Aliases: drake_get_session_info

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D make(my_plan) # Run the project, build the targets.
##D drake_get_session_info() # Get the cached sessionInfo() of the last make().
##D })
## End(Not run)



