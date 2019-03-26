library(drake)


### Name: drake_graph_info
### Title: Create the underlying node and edge data frames behind
###   'vis_drake_graph()'.
### Aliases: drake_graph_info

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D config <- drake_config(my_plan) # my_plan loaded with load_mtcars_example()
##D vis_drake_graph(config) # Jump straight to the interactive graph.
##D # Get a list of data frames representing the nodes, edges,
##D # and legend nodes of the visNetwork graph from vis_drake_graph().
##D raw_graph <- drake_graph_info(config = config)
##D # Choose a subset of the graph.
##D smaller_raw_graph <- drake_graph_info(
##D   config = config,
##D   from = c("small", "reg2"),
##D   mode = "in"
##D )
##D # Inspect the raw graph.
##D str(raw_graph)
##D # Use the data frames to plot your own custom visNetwork graph.
##D # For example, you can omit the legend nodes
##D # and change the direction of the graph.
##D library(visNetwork)
##D graph <- visNetwork(nodes = raw_graph$nodes, edges = raw_graph$edges)
##D visHierarchicalLayout(graph, direction = 'UD')
##D # Optionally visualize clusters.
##D config$plan$large_data <- grepl("large", config$plan$target)
##D graph <- drake_graph_info(
##D   config, group = "large_data", clusters = c(TRUE, FALSE))
##D tail(graph$nodes)
##D render_drake_graph(graph)
##D # You can even use clusters given to you for free in the `graph$nodes`
##D # data frame.
##D graph <- drake_graph_info(
##D   config, group = "status", clusters = "imported")
##D tail(graph$nodes)
##D render_drake_graph(graph)
##D })
## End(Not run)



