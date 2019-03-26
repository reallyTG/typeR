library(Seurat)


### Name: PCTopCells
### Title: Find cells with highest PCA scores
### Aliases: PCTopCells

### ** Examples

pbmc_small
head(PCTopCells(object = pbmc_small))
# Can specify which dimension and how many cells to return
DimTopCells(object = pbmc_small, dim.use = 2, num.cells = 5)




