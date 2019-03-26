library(igraph)


### Name: sample_smallworld
### Title: The Watts-Strogatz small-world model
### Aliases: sample_smallworld watts.strogatz.game smallworld
### Keywords: graphs

### ** Examples


g <- sample_smallworld(1, 100, 5, 0.05)
mean_distance(g)
transitivity(g, type="average")




