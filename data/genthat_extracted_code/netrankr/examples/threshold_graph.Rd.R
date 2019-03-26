library(netrankr)


### Name: threshold_graph
### Title: Random threshold graphs
### Aliases: threshold_graph

### ** Examples

library(igraph)
g <- threshold_graph(10,0.3)
## Not run: 
##D plot(g)
##D 
##D # star graphs and complete graphs are threshold graphs
##D complete <- threshold_graph(10,1) #complete graph
##D plot(complete)
##D 
##D star <- threshold_graph(10,0) #star graph
##D plot(star)
## End(Not run)

# centrality scores are perfectly rank correlated
cor(degree(g),closeness(g),method = "kendall")



