library(Seurat)


### Name: MarkerTest
### Title: ROC-based marker discovery
### Aliases: MarkerTest

### ** Examples

pbmc_small
MarkerTest(pbmc_small, cells.1 = WhichCells(object = pbmc_small, ident = 1),
            cells.2 = WhichCells(object = pbmc_small, ident = 2))




