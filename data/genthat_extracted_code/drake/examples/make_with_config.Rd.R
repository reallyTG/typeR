library(drake)


### Name: make_with_config
### Title: Run 'make()', on an existing internal configuration list.
### Aliases: make_with_config

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D # The following lines are the same as make(my_plan)
##D config <- drake_config(my_plan) # Create the internal config list.
##D make_with_config(config = config) # Run the project, build the targets.
##D })
## End(Not run)



