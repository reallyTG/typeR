library(tidygraph)


### Name: as_tbl_graph.data.frame
### Title: A data structure for tidy graph manipulation
### Aliases: as_tbl_graph.data.frame as_tbl_graph.Node
###   as_tbl_graph.dendrogram as_tbl_graph.graphNEL as_tbl_graph.graphAM
###   as_tbl_graph.graphBAM as_tbl_graph.hclust as_tbl_graph.igraph
###   as_tbl_graph.list as_tbl_graph.matrix as_tbl_graph.network
###   as_tbl_graph.phylo as_tbl_graph.evonet tbl_graph as_tbl_graph
###   as_tbl_graph.default is.tbl_graph

### ** Examples

rstat_nodes <- data.frame(name = c("Hadley", "David", "Romain", "Julia"))
rstat_edges <- data.frame(from = c(1, 1, 1, 2, 3, 3, 4, 4, 4), 
                            to = c(2, 3, 4, 1, 1, 2, 1, 2, 3))
tbl_graph(nodes = rstat_nodes, edges = rstat_edges)



