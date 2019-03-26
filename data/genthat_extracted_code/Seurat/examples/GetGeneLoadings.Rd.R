library(Seurat)


### Name: GetGeneLoadings
### Title: Dimensional Reduction Gene Loadings Accessor Function
### Aliases: GetGeneLoadings

### ** Examples

pbmc_small
# Examine the head of the first 5 PC gene loadings
head(GetGeneLoadings(object = pbmc_small, reduction.type = "pca", dims.use = 1:5))




