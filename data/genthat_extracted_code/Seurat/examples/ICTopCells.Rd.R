library(Seurat)


### Name: ICTopCells
### Title: Find cells with highest ICA scores
### Aliases: ICTopCells

### ** Examples

pbmc_small
pbmc_small <- RunICA(object = pbmc_small, ics.compute = 10, ics.print = 0)
pbmc_small <- ProjectDim(object = pbmc_small, reduction.type = "ica", do.print = FALSE)
ICTopCells(object = pbmc_small)
# Can specify which dimension and how many cells to return
ICTopCells(object = pbmc_small, ic.use = 2, num.cells = 5)




