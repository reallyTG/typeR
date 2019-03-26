library(TDAmapper)


### Name: mapper1D
### Title: mapper1D function
### Aliases: mapper1D
### Keywords: mapper1D

### ** Examples

m1 <- mapper1D(
       distance_matrix = dist(data.frame( x=2*cos(0.5*(1:100)), y=sin(1:100) )),
       filter_values = 2*cos(0.5*(1:100)),
       num_intervals = 10,
       percent_overlap = 50,
       num_bins_when_clustering = 10)
## Not run: 
##D #install.packages("igraph")
##D library(igraph)
##D g1 <- graph.adjacency(m1$adjacency, mode="undirected")
##D plot(g1, layout = layout.auto(g1) )
## End(Not run)



