library(Seurat)


### Name: AssessNodes
### Title: Assess Internal Nodes
### Aliases: AssessNodes

### ** Examples

## Not run: 
##D pbmc_small
##D pbmc_small <- FindClusters(object = pbmc_small, reduction.type = "pca",
##D                            dims.use = 1:10, resolution = 1.1, save.SNN = TRUE)
##D pbmc_small <- BuildClusterTree(pbmc_small, reorder.numeric = TRUE, do.reorder = TRUE)
##D AssessNodes(pbmc_small)
## End(Not run)




