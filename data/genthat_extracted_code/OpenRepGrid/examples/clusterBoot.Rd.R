library(OpenRepGrid)


### Name: clusterBoot
### Title: Multiscale bootstrap cluster analysis.
### Aliases: clusterBoot

### ** Examples

## Not run: 
##D 
##D  # pvclust must be loaded
##D  library(pvclust)
##D  
##D  # p-values for construct dendrogram
##D  s <- clusterBoot(boeker)
##D  plot(s)
##D  pvrect(s, max.only=FALSE)
##D  
##D  # p-values for element dendrogram
##D  s <- clusterBoot(boeker, along=2)
##D  plot(s)
##D  pvrect(s, max.only=FALSE)
## End(Not run)




