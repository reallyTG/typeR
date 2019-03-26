library(qgraph)


### Name: FDRnetwork
### Title: Model selection using local False Discovery Rate
### Aliases: FDRnetwork

### ** Examples

## Not run: 
##D ### Using bfi dataset from psych ###
##D library("psych")
##D data(bfi)
##D 
##D ### CORRELATIONS ###
##D # Compute correlations:
##D CorMat <- cor_auto(bfi[,1:25])
##D 
##D # Run local FDR:
##D CorMat_FDR <- FDRnetwork(CorMat)
##D 
##D # Number of edges remaining:
##D mean(CorMat_FDR[upper.tri(CorMat_FDR,diag=FALSE)]!=0)
##D 
##D # None, so might use different criterion:
##D CorMat_FDR <- FDRnetwork(CorMat, method = "pval")
##D 
##D 
##D # Compare:
##D L <- averageLayout(CorMat, CorMat_FDR)
##D 
##D layout(t(1:2))
##D qgraph(CorMat, layout = L, title = "Correlation network", 
##D        maximum = 1, cut = 0.1, minimum = 0, esize = 20)
##D qgraph(CorMat_FDR, layout = L, title = "Local FDR correlation network", 
##D        maximum = 1, cut = 0.1, minimum = 0, esize = 20)
##D 
##D # Centrality:
##D centralityPlot(list(cor=CorMat, fdr = CorMat_FDR))
##D 
##D 
##D ### PARTIAL CORRELATIONS ###
##D # Partial correlation matrix:
##D library("parcor")
##D PCorMat <- cor2pcor(CorMat)
##D 
##D # Run local FDR:
##D PCorMat_FDR <- FDRnetwork(PCorMat, cutoff = 0.1, method = "pval")
##D 
##D # Number of edges remaining:
##D mean(PCorMat_FDR[upper.tri(PCorMat_FDR,diag=FALSE)]!=0)
##D 
##D # Compare:
##D L <- averageLayout(PCorMat, PCorMat_FDR)
##D 
##D layout(t(1:2))
##D qgraph(PCorMat, layout = L, title = "Partial correlation network", 
##D           maximum = 1, cut = 0.1, minimum = 0, esize = 20)
##D qgraph(PCorMat_FDR, layout = L, title = "Local FDR partial correlation network", 
##D           maximum = 1, cut = 0.1, minimum = 0, esize = 20)
##D 
##D # Centrality:
##D centralityPlot(list(cor=PCorMat, fdr = PCorMat_FDR))
## End(Not run)



