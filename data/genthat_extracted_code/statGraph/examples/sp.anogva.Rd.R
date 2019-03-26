library(statGraph)


### Name: sp.anogva
### Title: Semi-Parametric Analysis Of Graph Variability (ANOGVA)
### Aliases: sp.anogva
### Keywords: semi_parametric_analysis_of_graph_variability

### ** Examples


## Please uncomment the following lines to run an example
# require(igraph)
# set.seed(42)
# model <- "ER"
# graph <- list()

## Under H0
# graph[[1]] <- get.adjacency(erdos.renyi.game(50, 0.5))
# graph[[2]] <- get.adjacency(erdos.renyi.game(50, 0.5))
# graph[[3]] <- get.adjacency(erdos.renyi.game(50, 0.5))
# result <- sp.anogva(graph, model, maxBoot = 300)
# result

## Under H1
# graph[[1]] <- get.adjacency(erdos.renyi.game(50, 0.5))
# graph[[2]] <- get.adjacency(erdos.renyi.game(50, 0.55))
# graph[[3]] <- get.adjacency(erdos.renyi.game(50, 0.5))
# result <- sp.anogva(graph, model, maxBoot = 300)
# result




