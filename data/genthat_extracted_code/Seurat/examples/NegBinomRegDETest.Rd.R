library(Seurat)


### Name: NegBinomRegDETest
### Title: Negative binomial test for UMI-count based data (regularized
###   version)
### Aliases: NegBinomRegDETest

### ** Examples

# Note, not recommended for particularly small datasets - expect warnings
NegBinomDETest(
  object = pbmc_small,
  cells.1 = WhichCells(object = pbmc_small, ident = 1),
  cells.2 = WhichCells(object = pbmc_small, ident = 2)
)




