library(Seurat)


### Name: GenesInCluster
### Title: GenesInCluster
### Aliases: GenesInCluster

### ** Examples

pbmc_small
# Cluster on genes only
pbmc_small <- DoKMeans(object = pbmc_small, k.genes = 3)
pbmc_small <- GenesInCluster(object = pbmc_small, cluster.num = 1)




