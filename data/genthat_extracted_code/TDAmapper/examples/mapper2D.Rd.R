library(TDAmapper)


### Name: mapper2D
### Title: mapper2D function
### Aliases: mapper2D
### Keywords: mapper2D

### ** Examples

m2 <- mapper2D(
       distance_matrix = dist(data.frame( x=2*cos(1:100), y=sin(1:100) )),
       filter_values = list( 2*cos(1:100), sin(1:100) ),
       num_intervals = c(5,5),
       percent_overlap = 50,
       num_bins_when_clustering = 10)
## Not run: 
##D library(igraph)
##D g2 <- graph.adjacency(m2$adjacency, mode="undirected")
##D plot(g2, layout = layout.auto(g2) )
## End(Not run)



