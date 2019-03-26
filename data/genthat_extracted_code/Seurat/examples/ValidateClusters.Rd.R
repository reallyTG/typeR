library(Seurat)


### Name: ValidateClusters
### Title: Cluster Validation
### Aliases: ValidateClusters

### ** Examples

pbmc_small
# May throw warnings when cluster sizes are particularly small
## Not run: 
##D pbmc_small <- FindClusters(object = pbmc_small, reduction.type = "pca",
##D                            dims.use = 1:10, resolution = 1.1, save.SNN = TRUE)
##D pbmc_small <- ValidateClusters(pbmc_small, pc.use = 1:10)
## End(Not run)




