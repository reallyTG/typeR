library(drake)


### Name: render_drake_ggraph
### Title: Render a static 'ggplot2'/'ggraph' visualization from
###   'drake_graph_info()' output.
### Aliases: render_drake_ggraph

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D # Instead of jumpting right to vis_drake_graph(), get the data frames
##D # of nodes, edges, and legend nodes.
##D config <- drake_config(my_plan) # Internal configuration list
##D drake_ggraph(config) # Jump straight to the static graph.
##D # Get the node and edge info that vis_drake_graph() just plotted:
##D graph <- drake_graph_info(config)
##D render_drake_ggraph(graph)
##D })
## End(Not run)



