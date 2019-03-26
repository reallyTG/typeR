library(Seurat)


### Name: NumberClusters
### Title: Convert the cluster labels to a numeric representation
### Aliases: NumberClusters

### ** Examples

# Append "Cluster_" to cluster IDs to demonstrate numerical conversion
new.cluster.labels <- paste0("Cluster_", pbmc_small@ident)
pbmc_small <- SetIdent(
  object = pbmc_small,
  cells.use = pbmc_small@cell.names,
  ident.use = new.cluster.labels
)
unique(pbmc_small@ident)
# Now relabel the IDs numerically starting from 1
pbmc_small <- NumberClusters(pbmc_small)
unique(pbmc_small@ident)




