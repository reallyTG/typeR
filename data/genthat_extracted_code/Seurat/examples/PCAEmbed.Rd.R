library(Seurat)


### Name: PCAEmbed
### Title: PCA Cell Embeddings Accessor Function
### Aliases: PCAEmbed

### ** Examples

pbmc_small
head(PCAEmbed(pbmc_small))
# Optionally, you can specify subsets of dims or cells to use
PCAEmbed(pbmc_small, dims.use = 1:5, cells.use = pbmc_small@cell.names[1:5])




