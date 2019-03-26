library(Seurat)


### Name: RenameCells
### Title: Rename cells
### Aliases: RenameCells

### ** Examples

head(pbmc_small@cell.names)
pbmc_small <- RenameCells(pbmc_small, add.cell.id = "Test")
head(pbmc_small@cell.names)




