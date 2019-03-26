library(Seurat)


### Name: ValidateSpecificClusters
### Title: Specific Cluster Validation
### Aliases: ValidateSpecificClusters

### ** Examples

## Not run: 
##D pbmc_small
##D pbmc_small <- FindClusters(object = pbmc_small, reduction.type = "pca",
##D                            dims.use = 1:10, resolution = 1.1, save.SNN = TRUE)
##D pbmc_small <- ValidateSpecificClusters(pbmc_small, cluster1 = 1,
##D                                        cluster2 = 2,  pc.use = 1:10)
## End(Not run)




