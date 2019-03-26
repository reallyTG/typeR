library(Seurat)


### Name: ProjectPCA
### Title: Project Principal Components Analysis onto full dataset
### Aliases: ProjectPCA

### ** Examples

pbmc_small
pbmc_small <- ProjectPCA(pbmc_small)
# Vizualize top projected genes in heatmap
PCHeatmap(pbmc_small,pc.use = 1,use.full = TRUE,do.balanced = TRUE)




