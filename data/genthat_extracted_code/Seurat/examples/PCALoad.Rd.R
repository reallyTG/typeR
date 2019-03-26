library(Seurat)


### Name: PCALoad
### Title: PCA Gene Loadings Accessor Function
### Aliases: PCALoad

### ** Examples

pbmc_small
head(PCALoad(pbmc_small))
# Optionally, you can specify subsets of dims or genes to use
PCALoad(pbmc_small, dims.use = 1:5, genes.use = pbmc_small@var.genes[1:5])




