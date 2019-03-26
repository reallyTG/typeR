library(flare)


### Name: sugm.generator
### Title: Data generator for sparse undirected graph estimation.
### Aliases: sugm.generator

### ** Examples

## load package required
library(flare)

## band graph with bandwidth 3
L = sugm.generator(graph = "band", g = 3)
plot(L)

## random sparse graph
L = sugm.generator(vis = TRUE)

## random dense graph
L = sugm.generator(prob = 0.5, vis = TRUE)

## hub graph with 6 hubs
L = sugm.generator(graph = "hub", g = 6, vis = TRUE)

## cluster graph with 8 clusters
L = sugm.generator(graph = "cluster", g = 8, vis = TRUE)

## scale-free graphs
L = sugm.generator(graph="scale-free", vis = TRUE)



