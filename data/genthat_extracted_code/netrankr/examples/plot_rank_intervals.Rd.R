library(netrankr)


### Name: plot_rank_intervals
### Title: Plot rank intervals
### Aliases: plot_rank_intervals

### ** Examples

library(igraph)
library(ggplot2)
g <- graph.empty(n=11,directed = FALSE)
g <- add_edges(g,c(1,11,2,4,3,5,3,11,4,8,5,9,5,11,6,7,6,8,
                   6,10,6,11,7,9,7,10,7,11,8,9,8,10,9,10))
P <- neighborhood_inclusion(g)
## Not run: plot_rank_intervals(P)

#adding index based rankings
cent_scores <- data.frame(
  degree = degree(g),
  betweenness = round(betweenness(g),4),
  closeness = round(closeness(g),4),
  eigenvector = round(eigen_centrality(g)$vector,4))
## Not run: plot_rank_intervals(P,cent.df=cent_scores)



