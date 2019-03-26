library(Seurat)


### Name: SetIdent
### Title: Set identity class information
### Aliases: SetIdent

### ** Examples

cluster2 <- WhichCells(object = pbmc_small, ident = 2)
pbmc_small@ident[cluster2]
pbmc_small <- SetIdent(
  object = pbmc_small,
  cells.use = cluster2,
  ident.use = 'cluster_2'
)
pbmc_small@ident[cluster2]




