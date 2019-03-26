library(drake)


### Name: drake_config
### Title: Create the internal runtime parameter list used internally in
###   'make()'.
### Aliases: drake_config

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D # Construct the master internal configuration list.
##D config <- drake_config(my_plan)
##D vis_drake_graph(config) # See the dependency graph.
##D sankey_drake_graph(config) # See the dependency graph.
##D # These functions are faster than otherwise
##D # because they use the configuration list.
##D outdated(config) # Which targets are out of date?
##D missed(config) # Which imports are missing?
##D })
## End(Not run)



