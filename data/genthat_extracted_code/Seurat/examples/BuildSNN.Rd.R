library(Seurat)


### Name: BuildSNN
### Title: SNN Graph Construction
### Aliases: BuildSNN

### ** Examples


pbmc_small
# Compute an SNN on the gene expression level
pbmc_small <- BuildSNN(pbmc_small, genes.use = pbmc_small@var.genes)

# More commonly, we build the SNN on a dimensionally reduced form of the data
# such as the first 10 principle components.

pbmc_small <- BuildSNN(pbmc_small, reduction.type = "pca", dims.use = 1:10)




