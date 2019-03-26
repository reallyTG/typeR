library(drake)


### Name: tracked
### Title: List the targets and imports that are reproducibly tracked.
### Aliases: tracked

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Load the canonical example for drake.
##D # List all the targets/imports that are reproducibly tracked.
##D config <- drake_config(my_plan)
##D tracked(config)
##D })
## End(Not run)



