library(fastclime)


### Name: fastclime.generator
### Title: Data generator
### Aliases: fastclime.generator

### ** Examples

## band graph with bandwidth 3
L = fastclime.generator(graph = "band", g = 3)
plot(L)

## random sparse graph
L = fastclime.generator(vis = TRUE)

## random dense graph
L = fastclime.generator(prob = 0.5, vis = TRUE)

## hub graph with 6 hubs
L = fastclime.generator(graph = "hub", g = 6, vis = TRUE)

## hub graph with 8 clusters
L = fastclime.generator(graph = "cluster", g = 8, vis = TRUE)




