library(drake)


### Name: read_drake_plan
### Title: Read the workflow plan from your last attempted call to
###   'make()'.
### Aliases: read_drake_plan

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D make(my_plan) # Run the project, build the targets.
##D read_drake_plan() # Retrieve the workflow plan data frame from the cache.
##D })
## End(Not run)



