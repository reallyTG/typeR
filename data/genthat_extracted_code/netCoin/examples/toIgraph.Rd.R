library(netCoin)


### Name: toIgraph
### Title: igraph object.
### Aliases: toIgraph

### ** Examples

# A character column (with separator)
frame <- data.frame(A = c("Man; Women", "Women; Women",
                        "Man; Man", "Undet.; Women; Man"))
data <- dichotomize(frame, "A", sep="; ")[2:4]
C <- coin(data) # coincidence matrix
N <- asNodes(C) # node data frame
E <- edgeList(C) # edge data frame
net <- netCoin(N, E) # netCoin object
toIgraph(net) # conversion into a igraph object



