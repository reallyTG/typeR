library(Seurat)


### Name: DotPlotOld
### Title: Old Dot plot visualization (pre-ggplot implementation) Intuitive
###   way of visualizing how gene expression changes across different
###   identity classes (clusters). The size of the dot encodes the
###   percentage of cells within a class, while the color encodes the
###   AverageExpression level of 'expressing' cells (green is high).
### Aliases: DotPlotOld

### ** Examples

cd_genes <- c("CD247", "CD3E", "CD9")
DotPlotOld(object = pbmc_small, genes.plot = cd_genes)




