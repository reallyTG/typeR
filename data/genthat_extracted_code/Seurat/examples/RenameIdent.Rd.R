library(Seurat)


### Name: RenameIdent
### Title: Rename one identity class to another
### Aliases: RenameIdent

### ** Examples

head(x = pbmc_small@ident)
pbmc_small <- RenameIdent(
  object = pbmc_small,
  old.ident.name = 0,
  new.ident.name = 'cluster_0'
)
head(x = pbmc_small@ident)




