library(qgraph)


### Name: flow
### Title: Draws network as a flow diagram showing how one node is
###   connected to all other nodes
### Aliases: flow

### ** Examples

## Not run: 
##D # Load data:
##D library("psych")
##D data(bfi)
##D 
##D # Compute polychoric correlations:
##D corMat <- cor_auto(bfi[,1:25])
##D 
##D # Glasso network:
##D g2 <- qgraph(corMat,  cut = 0, graph = "glasso", sampleSize = nrow(bfi),
##D              threshold = TRUE)
##D 
##D # Flow from A2:
##D flow(g2, "A2", horizontal = TRUE)
## End(Not run)



