library(Seurat)


### Name: DiffTTest
### Title: Differential expression testing using Student's t-test
### Aliases: DiffTTest

### ** Examples

pbmc_small
DiffTTest(pbmc_small, cells.1 = WhichCells(object = pbmc_small, ident = 1),
            cells.2 = WhichCells(object = pbmc_small, ident = 2))



