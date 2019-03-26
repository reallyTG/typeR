library(EcoNetGen)


### Name: netsampler
### Title: Network Sampling Routine
### Aliases: netsampler

### ** Examples

## No test: 
set.seed(12345)
net <- netgen()
sample <- netsampler(net)

## Precompute `module_sizes` for replicate sampling of the same network:
 library(igraph)
 modules <- cluster_edge_betweenness(as.undirected(net))
 module_sizes <- vapply(igraph::groups(modules), length, integer(1))
 sample <- netsampler(net, module_sizes = module_sizes)

## End(No test)




