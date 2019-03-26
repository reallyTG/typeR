library(Seurat)


### Name: DoKMeans
### Title: K-Means Clustering
### Aliases: DoKMeans

### ** Examples

pbmc_small
# Cluster on genes only
pbmc_small <- DoKMeans(pbmc_small, k.genes = 3)
# Cluster on genes and cell
pbmc_small <- DoKMeans(pbmc_small, k.genes = 3, k.cells = 3)




