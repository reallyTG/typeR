library(igraph)


### Name: local_scan
### Title: Compute local scan statistics on graphs
### Aliases: local_scan

### ** Examples

pair <- sample_correlated_gnp_pair(n = 10^3, corr = 0.8, p = 0.1)
local_0_us <- local_scan(graph.us = pair$graph1, k = 0)
local_1_us <- local_scan(graph.us = pair$graph1, k = 1)

local_0_them <- local_scan(graph.us = pair$graph1,
                           graph.them = pair$graph2, k = 0)
local_1_them <- local_scan(graph.us = pair$graph1,
                           graph.them = pair$graph2, k = 1)

Neigh_1 <- neighborhood(pair$graph1, order = 1)
local_1_them_nhood <- local_scan(graph.us = pair$graph1,
                                 graph.them = pair$graph2,
                                 neighborhoods = Neigh_1)



