library(igraph)


### Name: sample_fitness_pl
### Title: Scale-free random graphs, from vertex fitness scores
### Aliases: sample_fitness_pl static.power.law.game
### Keywords: graphs

### ** Examples


g <- sample_fitness_pl(10000, 30000, 2.2, 2.3)
## Not run: plot(degree_distribution(g, cumulative=TRUE, mode="out"), log="xy")



