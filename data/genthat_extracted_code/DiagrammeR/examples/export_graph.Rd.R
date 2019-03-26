library(DiagrammeR)


### Name: export_graph
### Title: Export a graph to various file formats
### Aliases: export_graph

### ** Examples

## Not run: 
##D # Create a simple graph
##D graph <-
##D   create_graph() %>%
##D     add_path(
##D       n = 5,
##D       edge_aes = edge_aes(
##D         arrowhead = c(
##D           "normal", "vee",
##D           "tee", "dot"),
##D         color = c(
##D         "red", "blue",
##D         "orange", "purple")))
##D 
##D # Create a PDF file for
##D # the graph (`graph.pdf`)
##D graph %>%
##D   export_graph(
##D     file_name = "graph.pdf",
##D     title = "Simple Graph")
##D 
##D # Create a PNG file for
##D # the graph (`mypng.png`)
##D graph %>%
##D   export_graph(
##D     file_name = "mypng.png",
##D     file_type = "PNG")
## End(Not run)



