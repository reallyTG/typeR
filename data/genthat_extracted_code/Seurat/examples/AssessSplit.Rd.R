library(Seurat)


### Name: AssessSplit
### Title: Assess Cluster Split
### Aliases: AssessSplit

### ** Examples

pbmc_small
pbmc_small <- FindClusters(object = pbmc_small, reduction.type = "pca",
                           dims.use = 1:10, resolution = 1.1, save.SNN = TRUE)
pbmc_small <- BuildClusterTree(pbmc_small, reorder.numeric = TRUE, do.reorder = TRUE)
# Assess based on a given node
AssessSplit(pbmc_small, node = 11)
# Asses based on two given clusters (or vectors of clusters)
AssessSplit(pbmc_small, cluster1 = 5, cluster2 = 6)
AssessSplit(pbmc_small, cluster1 = 4, cluster2 = c(5, 6))




