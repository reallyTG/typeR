library(Seurat)


### Name: DimTopGenes
### Title: Find genes with highest scores for a given dimensional reduction
###   technique
### Aliases: DimTopGenes

### ** Examples

pbmc_small
DimTopGenes(object = pbmc_small, dim.use = 1, reduction.type = "pca")
# After projection:
DimTopGenes(object = pbmc_small, dim.use = 1, reduction.type = "pca", use.full = TRUE)




