library(drake)


### Name: read_drake_graph
### Title: Read the igraph dependency network from your last attempted call
###   to 'make()'.
### Aliases: read_drake_graph

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D make(my_plan) # Run the project, build the targets.
##D # Retrieve the igraph network from the cache.
##D g <- read_drake_graph()
##D class(g) # "igraph"
##D })
## End(Not run)



