library(drake)


### Name: deps_target
### Title: List the dependencies of one or more targets
### Aliases: deps_target

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D config <- drake_config(my_plan)
##D deps_target("regression1_small", config = config)
##D })
## End(Not run)



