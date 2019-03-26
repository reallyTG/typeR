library(drake)


### Name: read_drake_config
### Title: Read the cached 'drake_config()' list from the last 'make()'.
### Aliases: read_drake_config

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D make(my_plan) # Run the project, build the targets.
##D # Retrieve the master internal configuration list from the cache.
##D read_drake_config()
##D })
## End(Not run)



