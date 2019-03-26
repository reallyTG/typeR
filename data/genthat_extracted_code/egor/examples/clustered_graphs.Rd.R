library(egor)


### Name: clustered_graphs
### Title: Cluster ego-centered networks by a grouping factor
### Aliases: clustered_graphs clustered_graphs.list clustered_graphs.egor
###   clustered_graphs.data.frame
### Keywords: analysis ego-centered network

### ** Examples

data("egor32")

# Simplify networks to clustered graphs, stored as igraph objects
graphs <- clustered_graphs(egor32, "country") 

# Visualise
vis_clustered_graphs(graphs, 
                     node.size.multiplier = 5, 
                     edge.width.multiplier = 25,
                     labels = TRUE)



