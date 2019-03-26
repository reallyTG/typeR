library(huge)


### Name: huge.generator
### Title: Data generator
### Aliases: huge.generator

### ** Examples

## band graph with bandwidth 3
L = huge.generator(graph = "band", g = 3)
plot(L)

## random sparse graph
L = huge.generator(vis = TRUE)

## random dense graph
L = huge.generator(prob = 0.5, vis = TRUE)

## hub graph with 6 hubs
L = huge.generator(graph = "hub", g = 6, vis = TRUE)

## hub graph with 8 clusters
L = huge.generator(graph = "cluster", g = 8, vis = TRUE)

## scale-free graphs
L = huge.generator(graph="scale-free", vis = TRUE)




