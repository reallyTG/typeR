library(drake)


### Name: render_sankey_drake_graph
### Title: Render a Sankey diagram from'drake_graph_info()'.
### Aliases: render_sankey_drake_graph

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D # Instead of jumpting right to sankey_drake_graph(), get the data frames
##D # of nodes, edges, and legend nodes.
##D config <- drake_config(my_plan) # Internal configuration list
##D sankey_drake_graph(config) # Jump straight to the interactive graph.
##D # Show the legend separately.
##D visNetwork::visNetwork(nodes = drake::legend_nodes())
##D # Get the node and edge info that sankey_drake_graph() just plotted:
##D graph <- drake_graph_info(config)
##D # You can pass the data frames right to render_sankey_drake_graph()
##D # (as in sankey_drake_graph()) or you can create
##D # your own custom visNewtork graph.
##D render_sankey_drake_graph(graph, width = '100%') # Width is passed to visNetwork.
##D # Optionally visualize clusters.
##D config$plan$large_data <- grepl("large", config$plan$target)
##D graph <- drake_graph_info(
##D   config, group = "large_data", clusters = c(TRUE, FALSE))
##D render_sankey_drake_graph(graph)
##D # You can even use clusters given to you for free in the `graph$nodes`
##D # data frame.
##D graph <- drake_graph_info(
##D   config, group = "status", clusters = "imported")
##D render_sankey_drake_graph(graph)
##D })
## End(Not run)



