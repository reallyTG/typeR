library(Seurat)


### Name: ProjectDim
### Title: Project Dimensional reduction onto full dataset
### Aliases: ProjectDim

### ** Examples

pbmc_small
pbmc_small <- ProjectDim(pbmc_small, reduction.type = "pca")
# Vizualize top projected genes in heatmap
DimHeatmap(pbmc_small,pc.use = 1,use.full = TRUE,do.balanced = TRUE,reduction.type = "pca")




