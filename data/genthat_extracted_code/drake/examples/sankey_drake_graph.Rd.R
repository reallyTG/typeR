library(drake)


### Name: sankey_drake_graph
### Title: Show a Sankey graph of your drake project.
### Aliases: sankey_drake_graph

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D config <- drake_config(my_plan)
##D # Plot the network graph representation of the workflow.
##D sankey_drake_graph(config, width = '100%') # The width is passed to visNetwork
##D # Show the legend separately.
##D visNetwork::visNetwork(nodes = drake::legend_nodes())
##D make(my_plan) # Run the project, build the targets.
##D sankey_drake_graph(config) # The black nodes from before are now green.
##D # Plot a subgraph of the workflow.
##D sankey_drake_graph(config, from = c("small", "reg2"))
##D # Optionally visualize clusters.
##D config$plan$large_data <- grepl("large", config$plan$target)
##D sankey_drake_graph(
##D   config, group = "large_data", clusters = c(TRUE, FALSE))
##D # You can even use clusters given to you for free in the `graph$nodes`
##D # data frame of `drake_graph_info()`.
##D sankey_drake_graph(
##D   config, group = "status", clusters = "imported")
##D })
## End(Not run)



