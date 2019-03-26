library(poppr)


### Name: poppr.msn
### Title: Create a minimum spanning network of selected populations using
###   a distance matrix.
### Aliases: poppr.msn msn.poppr

### ** Examples


# Load the data set and calculate the distance matrix for all individuals.
data(Aeut)
A.dist <- diss.dist(Aeut)

# Graph it.
A.msn <- poppr.msn(Aeut, A.dist, gadj = 15, vertex.label = NA)

# Find the sizes of the nodes (number of individuals per MLL):
igraph::vertex_attr(A.msn$graph, "size")^2

## Not run: 
##D # Set subpopulation structure.
##D Aeut.sub <- as.genclone(Aeut)
##D setPop(Aeut.sub) <- ~Pop/Subpop
##D 
##D # Plot respective to the subpopulation structure
##D As.msn <- poppr.msn(Aeut.sub, A.dist, gadj=15, vertex.label=NA)
##D 
##D # Show only the structure of the Athena population.
##D As.msn <- poppr.msn(Aeut.sub, A.dist, gadj=15, vertex.label=NA, sublist=1:10)
##D 
##D # Let's look at the structure of the microbov data set
##D 
##D library("igraph")
##D data(microbov)
##D micro.dist <- diss.dist(microbov, percent = TRUE)
##D micro.msn <- poppr.msn(microbov, micro.dist, vertex.label=NA)
##D 
##D # Let's plot it and show where individuals have < 15% of their genotypes 
##D # different.
##D 
##D edge_weight <- E(micro.msn$graph)$weight
##D edge_labels <- ifelse(edge_weight < 0.15, round(edge_weight, 3), NA)
##D plot.igraph(micro.msn$graph, edge.label = edge_labels, vertex.size = 2, 
##D edge.label.color = "red")
##D 
## End(Not run)




