library(Seurat)


### Name: WilcoxDETest
### Title: Differential expression using Wilcoxon Rank Sum
### Aliases: WilcoxDETest

### ** Examples

pbmc_small
WilcoxDETest(pbmc_small, cells.1 = WhichCells(object = pbmc_small, ident = 1),
            cells.2 = WhichCells(object = pbmc_small, ident = 2))




