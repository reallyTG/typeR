library(Seurat)


### Name: AddMetaData
### Title: Add Metadata
### Aliases: AddMetaData

### ** Examples

cluster_letters <- LETTERS[pbmc_small@ident]
pbmc_small <- AddMetaData(
  object = pbmc_small,
  metadata = cluster_letters,
  col.name = 'letter.idents'
)
head(x = pbmc_small@meta.data)




