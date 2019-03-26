library(drake)


### Name: deps_targets
### Title: Deprecated.
### Aliases: deps_targets
### Keywords: internal

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D config <- drake_config(my_plan)
##D deps_targets("regression1_small", config = config)
##D deps_targets(c("small", "large"), config = config, reverse = TRUE)
##D })
## End(Not run)



