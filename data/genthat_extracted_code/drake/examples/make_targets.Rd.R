library(drake)


### Name: make_targets
### Title: Just build the targets.
### Aliases: make_targets

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D # Generate the master internal configuration list.
##D con <- drake_config(my_plan)
##D # Just cache the imports, do not build any targets.
##D make_imports(config = con)
##D # Just make the targets
##D make_targets(config = con)
##D })
## End(Not run)



