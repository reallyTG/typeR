library(Seurat)


### Name: FindClusters
### Title: Cluster Determination
### Aliases: FindClusters

### ** Examples

## Not run: 
##D pbmc_small
##D pmbc_small <- FindClusters(
##D   object = pbmc_small,
##D   reduction.type = "pca",
##D   dims.use = 1:10,
##D   save.SNN = TRUE
##D )
##D # To explore a range of clustering options, pass a vector of values to the resolution parameter
##D pbmc_small <- FindClusters(
##D   object = pbmc_small,
##D   reduction.type = "pca",
##D   resolution = c(0.4, 0.8, 1.2),
##D   dims.use = 1:10,
##D   save.SNN = TRUE
##D )
## End(Not run)




