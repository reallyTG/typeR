library(dodgr)


### Name: dodgr_fundamental_cycles
### Title: dodgr_fundamental_cycles
### Aliases: dodgr_fundamental_cycles

### ** Examples

net <- weight_streetnet (hampi)
graph <- dodgr_contract_graph (net)$graph
verts <- dodgr_vertices (graph)
cyc <- dodgr_fundamental_cycles (graph, verts)



