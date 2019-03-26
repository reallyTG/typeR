library(qgraph)


### Name: EBICglasso
### Title: Compute Gaussian graphical model using graphical lasso based on
###   extended BIC criterium.
### Aliases: EBICglasso

### ** Examples

## Not run: 
##D ### Using bfi dataset from psych ###
##D library("psych")
##D data(bfi)
##D 
##D # Compute correlations:
##D CorMat <- cor_auto(bfi[,1:25])
##D 
##D # Compute graph with tuning = 0 (BIC):
##D BICgraph <- EBICglasso(CorMat, nrow(bfi), 0, threshold = TRUE)
##D 
##D # Compute graph with tuning = 0.5 (EBIC)
##D EBICgraph <- EBICglasso(CorMat, nrow(bfi), 0.5, threshold = TRUE)
##D 
##D # Plot both:
##D layout(t(1:2))
##D BICgraph <- qgraph(BICgraph, layout = "spring", title = "BIC", details = TRUE)
##D EBICgraph <- qgraph(EBICgraph, layout = "spring", title = "EBIC")
##D 
##D # Compare centrality and clustering:
##D layout(1)
##D centralityPlot(list(BIC = BICgraph, EBIC = EBICgraph))
##D clusteringPlot(list(BIC = BICgraph, EBIC = EBICgraph))
## End(Not run)



