library(Seurat)


### Name: DiffExpTest
### Title: Likelihood ratio test for zero-inflated data
### Aliases: DiffExpTest

### ** Examples

pbmc_small
DiffExpTest(pbmc_small, cells.1 = WhichCells(object = pbmc_small, ident = 1),
            cells.2 = WhichCells(object = pbmc_small, ident = 2))




