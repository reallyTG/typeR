library(ggdag)


### Name: as_tbl_graph
### Title: Convert DAGS to tidygraph
### Aliases: as_tbl_graph as_tbl_graph.tidy_dagitty as_tbl_graph
###   as_tbl_graph.dagitty

### ** Examples


library(ggraph)
library(tidygraph)
butterfly_bias() %>%
 as_tbl_graph() %>%
 ggraph() +
   geom_edge_diagonal() +
   geom_node_point()




