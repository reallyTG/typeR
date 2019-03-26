library(drake)


### Name: failed
### Title: List the targets that failed in the last call to 'make()'.
### Aliases: failed

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D make(my_plan) # Run the project, build the targets.
##D failed() # Should show that no targets failed.
##D # Build a workflow plan doomed to fail:
##D bad_plan <- drake_plan(x = function_doesnt_exist())
##D try(make(bad_plan), silent = TRUE) # error
##D failed() # "x"
##D diagnose(x) # Retrieve the cached error log of x.
##D })
## End(Not run)



