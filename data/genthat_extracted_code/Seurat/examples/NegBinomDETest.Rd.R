library(Seurat)


### Name: NegBinomDETest
### Title: Negative binomial test for UMI-count based data
### Aliases: NegBinomDETest

### ** Examples

pbmc_small
# Note, not recommended for particularly small datasets - expect warnings
NegBinomDETest(pbmc_small, cells.1 = WhichCells(object = pbmc_small, ident = 1),
            cells.2 = WhichCells(object = pbmc_small, ident = 2))




