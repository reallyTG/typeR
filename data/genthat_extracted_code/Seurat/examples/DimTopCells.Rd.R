library(Seurat)


### Name: DimTopCells
### Title: Find cells with highest scores for a given dimensional reduction
###   technique
### Aliases: DimTopCells

### ** Examples

pbmc_small
head(DimTopCells(object = pbmc_small, reduction.type = "pca"))
# Can specify which dimension and how many cells to return
DimTopCells(object = pbmc_small, reduction.type = "pca", dim.use = 2, num.cells = 5)




