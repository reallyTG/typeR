library(drake)


### Name: vis_drake_graph
### Title: Show an interactive visual network representation of your drake
###   project.
### Aliases: vis_drake_graph

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D config <- drake_config(my_plan)
##D # Plot the network graph representation of the workflow.
##D vis_drake_graph(config, width = '100%') # The width is passed to visNetwork
##D make(my_plan) # Run the project, build the targets.
##D vis_drake_graph(config) # The red nodes from before are now green.
##D # Plot a subgraph of the workflow.
##D vis_drake_graph(
##D   config,
##D   from = c("small", "reg2"),
##D   to = "summ_regression2_small"
##D )
##D # Optionally visualize clusters.
##D config$plan$large_data <- grepl("large", config$plan$target)
##D vis_drake_graph(
##D   config, group = "large_data", clusters = c(TRUE, FALSE))
##D # You can even use clusters given to you for free in the `graph$nodes`
##D # data frame of `drake_graph_info()`.
##D vis_drake_graph(
##D   config, group = "status", clusters = "imported")
##D })
## End(Not run)



