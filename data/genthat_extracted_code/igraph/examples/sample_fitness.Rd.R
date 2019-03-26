library(igraph)


### Name: sample_fitness
### Title: Random graphs from vertex fitness scores
### Aliases: sample_fitness static.fitness.game
### Keywords: graphs

### ** Examples


N <- 10000
g <- sample_fitness(5*N, sample((1:50)^-2, N, replace=TRUE))
degree_distribution(g)
## Not run: plot(degree_distribution(g, cumulative=TRUE), log="xy")



