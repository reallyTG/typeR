library(Seurat)


### Name: StashIdent
### Title: Set identity class information
### Aliases: StashIdent

### ** Examples

head(x = pbmc_small@meta.data)
pbmc_small <- StashIdent(object = pbmc_small, save.name = 'cluster.ident')
head(x = pbmc_small@meta.data)




