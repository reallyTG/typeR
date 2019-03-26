library(Seurat)


### Name: PCTopGenes
### Title: Find genes with highest PCA scores
### Aliases: PCTopGenes

### ** Examples

pbmc_small
PCTopGenes(object = pbmc_small, pc.use = 1)
# After projection:
PCTopGenes(object = pbmc_small, pc.use = 1, use.full = TRUE)




