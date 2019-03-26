library(igraph)


### Name: plot_dendrogram
### Title: Community structure dendrogram plots
### Aliases: plot_dendrogram dendPlot plot_dendrogram.communities
### Keywords: graphs

### ** Examples


karate <- make_graph("Zachary")
fc <- cluster_fast_greedy(karate)
plot_dendrogram(fc)




