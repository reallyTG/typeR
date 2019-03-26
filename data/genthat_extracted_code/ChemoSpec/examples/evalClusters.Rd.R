library(ChemoSpec)


### Name: evalClusters
### Title: Evaluate or Compare the Quality of Clusters Quantitatively
### Aliases: evalClusters
### Keywords: cluster multivariate

### ** Examples


# These are a little slow for CRAN checking
## Not run: 
##D 
##D data(metMUD2)
##D 
##D # Using clusterCrit
##D res1 <- hcaSpectra(metMUD2) # default clustering and distance methods
##D res2 <- hcaSpectra(metMUD2, d.method = "cosine")
##D # The return value from hcaSpectra is a list with hclust as the first element.
##D crit1 <- evalClusters(metMUD2, pkg = "clusterCrit", hclst = res1[[1]], k = 2)
##D crit2 <- evalClusters(metMUD2, pkg = "clusterCrit", hclst = res2[[1]], k = 2)
##D # crit1 and crit2 can now be compared.
##D 
##D # Using NbClust
##D res3 <- evalClusters(metMUD2, min.nc = 2, max.nc = 5, method = "average", index = "kl")
## End(Not run)




