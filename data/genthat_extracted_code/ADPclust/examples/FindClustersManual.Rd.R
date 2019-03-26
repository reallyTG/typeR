library(ADPclust)


### Name: FindClustersManual
### Title: User-interactive routine to find clusters
### Aliases: FindClustersManual

### ** Examples

data(clust3)
distm <- FindDistm(clust3, normalize = TRUE)
## Not run: 
##D fd <- FindFD(distm, 2, "mnorm")
##D ans <- FindClustersManual(distm, fd$f, fd$delta)
##D names(ans)
##D ans$centers
## End(Not run)



