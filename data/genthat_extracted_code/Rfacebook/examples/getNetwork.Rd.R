library(Rfacebook)


### Name: getNetwork
### Title: Extract network of friends of authenticated user
### Aliases: getNetwork

### ** Examples

## Not run: 
##D ## See examples for fbOAuth to know how token was created.
##D ## Copy and paste token created at FB Graph API Explorer
##D  token <- "XXXXXX"
##D  mat <- getNetwork(token=token, format="adj.matrix")
##D  library(igraph)
##D  network <- graph.adjacency(mat, mode="undirected")
##D  pdf("network_plot.pdf")
##D  plot(network)
##D  dev.off()
## End(Not run)




