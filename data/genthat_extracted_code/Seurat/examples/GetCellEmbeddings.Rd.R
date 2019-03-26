library(Seurat)


### Name: GetCellEmbeddings
### Title: Dimensional Reduction Cell Embeddings Accessor Function
### Aliases: GetCellEmbeddings

### ** Examples

pbmc_small
# Examine the head of the first 5 PC cell embeddings
head(GetCellEmbeddings(object = pbmc_small, reduction.type = "pca", dims.use = 1:5))




