library(Seurat)


### Name: SetClusters
### Title: Set Cluster Assignments
### Aliases: SetClusters

### ** Examples

pbmc_small
# Get clusters as a dataframe with GetClusters.
clusters <- GetClusters(object = pbmc_small)
# Use SetClusters to set cluster IDs
pbmc_small <- SetClusters(object = pbmc_small, clusters = clusters)




