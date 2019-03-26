library(dodgr)


### Name: dodgr_full_cycles
### Title: dodgr_full_cycles
### Aliases: dodgr_full_cycles

### ** Examples

net <- weight_streetnet (hampi)
graph <- dodgr_contract_graph (net)$graph
cyc1 <- dodgr_fundamental_cycles (graph)
cyc2 <- dodgr_full_cycles (net)
# cyc2 has same number of cycles, but each one is generally longer, through
# including all points intermediate to junctions; cyc1 has cycles composed of
# junction points only.



