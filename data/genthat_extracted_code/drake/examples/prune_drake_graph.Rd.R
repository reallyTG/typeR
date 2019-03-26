library(drake)


### Name: prune_drake_graph
### Title: Prune the dependency network of your project.
### Aliases: prune_drake_graph

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D # Build the igraph object representing the workflow dependency network.
##D graph <- drake_config(my_plan)$graph
##D # The default plotting is not the greatest,
##D # but you will get the idea.
##D # plot(graph) # nolint
##D # Prune the graph: that is, remove the nodes downstream
##D # from 'small' and 'large'
##D pruned <- prune_drake_graph(graph = graph, to = c("small", "large"))
##D # plot(pruned) # nolint
##D })
## End(Not run)



