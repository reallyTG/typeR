library(Seurat)


### Name: TransferIdent
### Title: Transfer identity class information (or meta data) from one
###   object to another
### Aliases: TransferIdent

### ** Examples

# Duplicate the test object and assign random new idents to transfer
pbmc_small@ident
pbmc_small2 <- SetIdent(object = pbmc_small, cells.use = pbmc_small@cell.names,
 ident.use = sample(pbmc_small@ident))
pbmc_small2@ident
pbmc_small <- TransferIdent(object.from = pbmc_small2, object.to = pbmc_small)
pbmc_small@ident




