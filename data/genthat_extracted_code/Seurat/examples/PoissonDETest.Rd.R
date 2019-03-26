library(Seurat)


### Name: PoissonDETest
### Title: Poisson test for UMI-count based data
### Aliases: PoissonDETest

### ** Examples

pbmc_small
# Note, expect warnings with example dataset due to min.cells threshold.
PoissonDETest(pbmc_small, cells.1 = WhichCells(object = pbmc_small, ident = 1),
            cells.2 = WhichCells(object = pbmc_small, ident = 2))




