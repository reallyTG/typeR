library(Seurat)


### Name: SetAllIdent
### Title: Switch identity class definition to another variable
### Aliases: SetAllIdent

### ** Examples

head(x = pbmc_small@ident)
pbmc_small <- SetAllIdent(object = pbmc_small, id = 'orig.ident')
head(x = pbmc_small@ident)




